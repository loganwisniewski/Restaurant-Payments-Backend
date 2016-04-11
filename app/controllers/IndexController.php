<?php

class IndexController extends ControllerBase
{

    public function indexAction()
    {
        $this->useDashboard("indexDash");
    }
}

