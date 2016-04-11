<?php

class AdminController extends ControllerBase
{

    public function indexAction()
    {
        $this->useDashboard("adminDash");

    }

    public function saveAction()
    {
        $show_logo = WebchefMeta::findFirstBywebchef_meta_key("show_logo");
        if($this->request->get("show_logo") == "true"){
            $show_logo->webchef_meta_value = "true";
        } else {
            $show_logo->webchef_meta_value = "false";
        }

        $show_logo->save();

        return $this->dispatcher->forward(
            array(
                'controller' => 'admin',
                'action' => 'index'
            )
        );
    }

}

