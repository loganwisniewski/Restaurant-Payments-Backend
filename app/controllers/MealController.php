<?php

use Phalcon\Logger;
use Phalcon\Logger\Adapter\File as FileAdapter;

class MealController extends ControllerBase
{

    public function indexAction()
    {

    }

    public function showAction($menu_id)
    {
        $this->useDashboard('configDash');

        $this->view->menu = Menu::findFirst($menu_id);
        $restaurant_id = $this->view->getParams("restaurant_id");
        $this->view->restaurant = Restaurant::findFirst($restaurant_id);


        if($this->request->isPost()){
            //  Search if POST
            $this->view->isPost = true;
            $this->view->searchTerm = $this->request->get("searchTerm");
            $this->view->meals =
                Meal::find(array(
                    "conditions" => "menu_id = '$menu_id' AND meal_type = 'meal' AND meal_name LIKE :searchTerm:",
                    "bind"       => array("searchTerm" => '%'.$this->view->searchTerm.'%'),
                    "order"      => "meal_name"
                ));
        } else {
            // Find if !POST
            $this->view->isPost = false;
            $this->view->meals = Meal::find(array(
                "menu_id = '$menu_id' AND meal_type = 'meal'"
            ));
        }

    }

    public function newAction($menu_id)
    {
        $this->useDashboard('configDash');

        $this->view->menu_name = Menu::findFirst($menu_id)->menu_name;
        $this->view->menu_id = $menu_id;
        if($this->request->isPost()){

            $meal = new Meal();

            $meal->menu_id = $menu_id;
            $meal->meal_name = $this->request->get("meal_name");
            $meal->meal_type = "meal";
            $meal->meal_price = $this->request->get("meal_price");
            $meal->meal_description = $this->request->get("meal_description");

            $meal->save();

            return $this->response->redirect("meal/show/$menu_id");
        }
    }

    public function editAction($meal_id)
    {
        $this->useDashboard('configDash');

        $this->view->setTemplateAfter('dashboard_1');
        $meal = Meal::findFirst($meal_id);
        $this->view->meal = $meal;
        $this->view->menu = Menu::findFirst($meal->menu_id);

        $mealParams = MealParam::find(array(
            "meal_id = $meal_id",
            "order" => "meal_param_order"
        ));


        $this->view->results = Param::find();


        $this->view->mealParams = $this->simpleView->render('meal/mealParams', array('mealParams'=> $mealParams));

    }

    public function saveAction($meal_id)
    {
        $this->useDashboard('configDash');

        $meal = Meal::findFirst($meal_id);
        $this->view->menu_id = $meal->menu_id;
        if($this->request->isPost()){

            $meal->meal_name = $this->request->get("meal_name");
            $meal->meal_price = $this->request->get("meal_price");
            $meal->meal_description = $this->request->get("meal_description");

            $meal->save();

            return $this->response->redirect("meal/edit/$meal->meal_id");
        }
    }

    public function paramShowAction($restaurant_id)
    {
        $this->useDashboard('configDash');
        $this->view->params = Param::findByrestaurant_id($restaurant_id);
    }

    public function paramEditAction($param_id)
    {
        $paramOptions = ParamOption::findByparam_id($param_id);
        $this->useDashboard('configDash');
        $this->view->param = Param::findFirst($param_id);
        $this->view->paramOptions = $this->simpleView->render('meal/paramOptions', array('paramOptions'=> $paramOptions));
    }

    public function paramSaveAction($param_id)
    {
        $this->useDashboard('configDash');

        $param = Param::findFirst($param_id);

        if($this->request->isPost()){

            $param->param_title = $this->request->get("param_title");
            $param->param_slug = $this->request->get("param_slug");
            $param->param_description = $this->request->get("param_description");
            $param->param_type = $this->request->get("param_type");
            $param->param_required = $this->request->get("param_required");

            $param->save();

            return $this->response->redirect("meal/paramEdit/$param->param_id");
        }
    }

    public function includeMealAction()
    {
        $this->view->disable();
        if(isset($_POST)) {
            $item_id = $this->request->get("meal_id");
            $item = Meal::findFirst($item_id);
            $item->meal_order = $this->nextNode($item->menu_id);
            $item->save();
            echo $this->getMenuHTML($item);
        }
    }

    public function includeParamAction()
    {
        $this->view->disable();
        if(isset($_POST)) {
            $param_id = $this->request->get("param_id");
            $meal_id = $this->request->get("meal_id");
            $item = new MealParam();
            $item->param_id = $param_id;
            $item->meal_id = $meal_id;
            $meal_param_order = MealParam::maximum(
                array(
                    "column" => "meal_param_order",
                    "conditions" => "meal_id = $meal_id"
                )
            );
            $item->meal_param_order = $meal_param_order + 1;
            $item->save();
            echo $this->getParamHTML($item);
        }
    }

    public function includeCategoryAction()
    {
        $this->view->disable();
        if(isset($_POST)) {
            $category_name = $this->request->get("category_name");
            $menu_id = $this->request->get("menu_id");
            $item = new Meal();
            $item->meal_name = $category_name;
            $item->meal_type = "category";
            $item->meal_order = $this->nextNode($menu_id);
            $item->menu_id = $menu_id;
            $item->save();
            echo $this->getMenuHTML($item);
        }
    }

    public function excludeItemAction()
    {
        $this->view->disable();
        if(isset($_POST)) {
            $item_id = $this->request->get("item_id");
            $item = Meal::findFirst($item_id);

            if($item->meal_type == "category"){
                $this->db->delete(Meal, "meal_id=$item_id");
            }

            if($item->meal_type == "meal"){
                $item->meal_order = NULL;
                $item->save();
            }

        }
    }

    public function excludeParamAction()
    {
        $this->view->disable();
        if(isset($_POST)) {
            $item_id = $this->request->get("item_id");
            $item = MealParam::findFirst($item_id);

            $this->db->delete(Meal_Param, "meal_param_id=$item_id");
        }
        echo $item_id;
    }

    public function getMenuHTML($items)
    {
        $item_list = array();
        array_push($item_list, $items);

        return $this->simpleView->render('meal/menuItems', array('items'=> $item_list));
    }

    public function getParamHTML($items)
    {

        return $this->simpleView->render('meal/mealParams', array('items'=> $items));
    }

    public function nextNode($menu_id)
    {
        $last_meal = Meal::findFirst(array(
            "order"      => "meal_order DESC",
            "menu_id = '$menu_id'"
        ));
        $next_node = $last_meal->meal_order;
        $next_node++;
        return $next_node;
    }

    public function paramReorderAction(){
        $this->view->disable();
        //  save MenuBuilder order
        if(isset($_POST["list"])){
            $postData = $this->request->get("list");
            $postItem = explode("&", $postData);
            $mealParams = array();
            foreach($postItem as $tmpItem){
                $tmpAssc = null;
                $tmpArray = explode("[]=", $tmpItem);
                array_push($mealParams, $tmpArray[1]);
            }

            foreach($mealParams as $x => $y){
                $mealParam = MealParam::findFirst($y);
                $mealParam->meal_param_order = $x;
                $mealParam->save();
            }
        }
    }


}

