<?php

class TestController extends ControllerBase
{

    public function indexAction()
    {
        $this->dispatcher->forward(array(
            "action" => "edit"
        ));
    }

    public function editAction()
    {
        $this->useDashboard('configDash');
    }

}

