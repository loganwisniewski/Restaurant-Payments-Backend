<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\View as View;
use Phalcon\Mvc\Dispatcher;

class ControllerBase extends Controller
{
    public function initialize(){
        $this->assets
            ->addJs('js/include/jquery.js')
            ->addJs('js/include/jquery-ui.js')
            ->addJs('http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js', false, false)
            ->addJs('js/javascript.js')
            ->addJs('files/selectize/selectize.js')
            ->addJs('files/prettify/prettify.js')
            ->addJs('files/prettify/jquery.hotkeys.js')
            ->addJs('js/include/wysiwyg.js')
            ->addCss('https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css', false, false)
            ->addCss('files/prettify/prettify.css')
            ->addCss('files/selectize/selectize.css')
            ->addCss('css/jquery-ui.css')
            ->addCss('css/jquery-ui.structure.css')
            ->addCss('css/jquery-ui.theme.css')
            ->addCss('css/font-awesome.css')
            ->addCss('css/custom.css');

        $this->view->restaurants = Restaurant::find(array(
            "order" => "restaurant_name"
        ));

        $restaurant = Restaurant::findFirst($_COOKIE["restaurant_id"]);
        $this->view->restaurant_name = $restaurant->restaurant_name;
        $this->view->restaurant_id = $restaurant->restaurant_id;
        $this->view->menu_name = Menu::findFirst($restaurant->menu_id)->menu_name;
        $this->view->website_name = Website::findFirst($restaurant->website_id)->website_name;
        $this->view->setVar("restaurant", $restaurant);
        $this->view->user = $this->session->get("user");
        $this->view->show_logo = WebchefMeta::findFirstBywebchef_meta_key("show_logo")->webchef_meta_value;

    }

    public function useDashboard($dashboard){
        $this->view->setRenderLevel(View::LEVEL_AFTER_TEMPLATE);
        $this->view->setLayout($dashboard);
    }
}
