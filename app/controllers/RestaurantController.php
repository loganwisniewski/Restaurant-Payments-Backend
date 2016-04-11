<?php

class RestaurantController extends ControllerBase
{

    public function indexAction()
    {
        return $this->dispatcher->forward(
            array(
                'controller' => 'restaurant',
                'action' => 'show'
            )
        );
    }

    public function showAction()
    {

        $this->useDashboard('configDash');

        if($this->request->isPost()){
            $this->view->isPost = true;
            $this->view->searchTerm = $this->request->get("searchTerm");
            $this->view->restaurants =
                Restaurant::find(array(
                "conditions" => "restaurant_name LIKE :searchTerm:",
                "bind"       => array("searchTerm" => '%'.$this->view->searchTerm.'%'),
                "order"      => "restaurant_name"
            ));
        } else {
            $this->view->isPost = false;
            $this->view->restaurants = Restaurant::find(array("order" => "restaurant_name"));
        }
    }

    public function editAction($restaurant_id)
    {
        $this->useDashboard('configDash');

        $restaurant = Restaurant::findFirst($restaurant_id);
        $this->view->restaurant = $restaurant;

        /*
         *  TODO: change to magic method
         */

        //  Build associative array for restaurants menus
        $menus = array();
        $menus[null] = "Please choose a menu";
        foreach($restaurant->restaurantMenu as $restaurantMenu){
            $menu = $restaurantMenu->Menu;
            $menus[$menu->menu_id] = $menu->menu_name;
        }
        $this->view->menus = $menus;
    }

    public function saveAction($restaurant_id)
    {
        if($this->request->isPost()){

            $restaurant = Restaurant::findFirst($restaurant_id);

            $restaurant->restaurant_name = $this->request->get("restaurant_name");
            $restaurant->restaurant_address = $this->request->get("restaurant_address");
            $restaurant->restaurant_city = $this->request->get("restaurant_city");
            if($this->request->get("restaurant_state") == ""){
                $restaurant->restaurant_state = null;
            } else {
                $restaurant->restaurant_state = $this->request->get("restaurant_state");
            }
            $restaurant->restaurant_zip = $this->request->get("restaurant_zip", "int");
            $restaurant->restaurant_phone = $this->request->get("restaurant_phone");
            $restaurant->restaurant_email = $this->request->get("restaurant_email", "email");
            $restaurant->restaurant_gmt = $this->request->get("restaurant_gmt");
            $restaurant->restaurant_tax = $this->request->get("restaurant_tax");
            $restaurant->restaurant_status = $this->request->get("restaurant_status");
            $restaurant->restaurant_cuisine = $this->request->get("restaurant_cuisine");
            if($this->request->get("menu_id") == ""){
                $restaurant->menu_id = NULL;
            } else {
                $restaurant->menu_id = $this->request->get("menu_id");
            }
            $restaurant->account_id = $this->request->get("account_id");

            $restaurant->save();

            return $this->dispatcher->forward(
                array(
                    'controller' => 'restaurant',
                    'action' => 'edit',
                    'params' => array($restaurant_id)
                )
            );
        }
    }

    public function newAction()
    {
        if($this->request->isPost()){

            $restaurant = new Restaurant();


            $restaurant->restaurant_name = $this->request->get("restaurant_name");
            $restaurant->restaurant_address = $this->request->get("restaurant_address");
            $restaurant->restaurant_city = $this->request->get("restaurant_city");
            $restaurant->restaurant_state = $this->request->get("restaurant_state");
            $restaurant->restaurant_zip = $this->request->get("restaurant_zip");
            $restaurant->restaurant_phone = $this->request->get("restaurant_phone");
            $restaurant->restaurant_email = $this->request->get("restaurant_email");
            $restaurant->restaurant_gmt = $this->request->get("restaurant_gmt");
            $restaurant->restaurant_tax = $this->request->get("restaurant_tax");
            $restaurant->restaurant_status = "active";
            $temp_guid = strtolower(preg_replace( "/[^a-zA-Z0-9_]/", "", str_replace(" ", "_", $restaurant->restaurant_name)));
            if(Restaurant::findFirstByrestaurant_guid($temp_guid)){
                $restaurant->save();
                $restaurant->restaurant_guid = $temp_guid . "_" . $restaurant->restaurant_id;
                $restaurant->save();
            } else {
                $restaurant->restaurant_guid = $temp_guid;
                $restaurant->save();
            }

            $structure = "../public/files/restaurants/".$restaurant->restaurant_guid."/";
            mkdir($structure, 0777, true);

            return $this->dispatcher->forward(
                array(
                    'controller' => 'restaurant',
                    'action' => 'show'
                )
            );
        }

        $this->useDashboard('configDash');
    }

    public function deleteAction($restaurant_id)
    {
        $this->useDashboard('configDash');
        $this->view->restaurant = Restaurant::findFirst($restaurant_id);
    }

    public function deleteConfirmAction($restaurant_id)
    {
        $this->db->delete(Restaurant, "restaurant_id=$restaurant_id");

        return $this->dispatcher->forward(
            array(
                'controller' => 'restaurant',
                'action' => 'show',
            )
        );
    }

    public function menusAction($restaurant_id)
    {
        $this->useDashboard('configDash');

        $restaurant = Restaurant::findFirst($restaurant_id);
        $this->view->restaurant = $restaurant;

        /*
         *  TODO: change to magic method
         */

        //  Get all restaurants menus
        $menus = array();
        foreach($restaurant->restaurantMenu as $restaurantMenu){
            array_push($menus, $restaurantMenu->Menu);
        }
        $this->view->menus = $menus;
    }

    public function verifyCookieAction()
    {
        $this->view->disable();
        $local = Restaurant::findFirst($this->request->get("restaurant_local"));
        $cookie = Restaurant::findFirst($this->request->get("restaurant_cookie"));
        echo $this->simpleView->render('restaurant/restaurantVerify', array('local' => $local, 'cookie' => $cookie));
    }

}

