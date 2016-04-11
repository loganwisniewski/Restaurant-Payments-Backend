<?php

class MenuController extends ControllerBase
{

    public function indexAction()
    {
        $this->dispatcher->forward(array(
            "action" => "edit"
        ));
    }

    public function editAction($menu_id)
    {
        $this->useDashboard('configDash');

        $menu = Menu::findFirst($menu_id);

            //  Search Results
        if(isset($_POST["searchTerm"])){
            $this->view->searchTerm = $this->request->get("searchTerm");
            $this->view->results =
                Meal::find(array(
                    "conditions" => "menu_id = $menu_id AND meal_name LIKE :searchTerm: AND meal_order IS NULL",
                    "bind"       => array("searchTerm" => '%'.$this->view->searchTerm.'%'),
                    "order"      => "meal_name"
                ));
        } else if(isset($_POST["menu_name"])) {
            $menu->menu_name = $this->request->get("menu_name");
            $menu->save();
        } else {
            $this->view->results = Meal::find(array(
                "menu_id = $menu_id AND meal_order IS NULL",
                "order" => "meal_name"
            ));
        }

        $this->view->menu_name = $menu->menu_name;
        $this->view->menu_id = $menu->menu_id;
        $this->view->restaurant_id = $menu->RestaurantMenu[0]->restaurant_id;
        //  MenuBuilder
        $items = Meal::find(array(
            "menu_id = $menu_id AND meal_order IS NOT NULL",
            "order" => "meal_order"
        ));

        $this->view->menuItems = $this->simpleView->render('meal/menuItems', array('items'=> $items));
    }

    public function saveAction(){
        $this->view->disable();
        //  save MenuBuilder order
        if(isset($_POST["list"])){
            $postData = $this->request->get("list");
            $postItem = explode("&", $postData);
            $meals = array();
            foreach($postItem as $tmpItem){
                $tmpAssc = null;
                $tmpArray = explode("[]=", $tmpItem);
                array_push($meals, $tmpArray[1]);
            }

            foreach($meals as $x => $y){
                $meal = Meal::findFirst($y);
                $meal->meal_order = $x;
                $meal->save();
            }
        }

        if(isset($_POST["menu_name"])){
            $postData = $this->request->get("menu_name");

        }
    }

    public function newAction($restaurant_id)
    {
        $this->useDashboard('configDash');

        if($restaurant_id == null){

        }

        //  IF POST: get values and save
        if($this->request->isPost()){
            $restaurant = Restaurant::findFirstByrestaurant_id($restaurant_id);

            $menu = new Menu();
            $menu->menu_name = $this->request->get("menu_name");
            $menu->menu_post_date = new \Phalcon\Db\RawValue("now()");
            $menu->save();

            $restaurant_menu = new RestaurantMenu();
            $restaurant_menu->restaurant_id = $restaurant->restaurant_id;
            $restaurant_menu->menu_id = $menu->menu_id;
            $restaurant_menu->save();

            // redirect to menu/show/$restaurant_id
            return $this->dispatcher->forward(
                array(
                    'controller' => 'restaurant',
                    'action' => 'menus',
                    'params' => array($restaurant_id)
                )
            );
        } else {
            $this->view->restaurant_id = $restaurant_id;
            $this->view->restaurant_name = Restaurant::findFirst($restaurant_id)->restaurant_name;
        }
    }

    public function deleteAction($menu_id)
    {
        $this->useDashboard('configDash');

        $menu = Menu::findFirst($menu_id);
        $this->view->menu = $menu;
        $this->view->restaurant_id = $menu->RestaurantMenu[0]->restaurant_id;

    }

    public function deleteConfirmAction($restaurant_id, $menu_id)
    {
        $this->db->delete(Restaurant_Menu, "menu_id=$menu_id");
        $this->db->delete(Menu, "menu_id=$menu_id");
        return $this->dispatcher->forward(
            array(
                'controller' => 'restaurant',
                'action' => 'menus',
                'params' => array($restaurant_id)
            )
        );
    }

}

