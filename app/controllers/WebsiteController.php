<?php

class WebsiteController extends ControllerBase
{

    public function indexAction()
    {
        return $this->dispatcher->forward(
            array(
                'controller' => 'website',
                'action' => 'show'
            )
        );
    }

    public function showAction($restaurant_id)
    {

        $this->useDashboard('configDash');

        $this->view->websites = Website::find(array(
            "conditions" => "restaurant_id = $restaurant_id",
            "order"      => "website_name"
        ));
    }

    public function newAction($restaurant_id)
    {

        $this->useDashboard('configDash');

        if($this->request->isPost()) {

            $website = new Website();


            $website->website_name = $this->request->get("website_name");
            $website->website_status = $this->request->get("website_status");
            $website->website_template = $this->request->get("website_template");
            $website->restaurant_id = $restaurant_id;

            $website->save();

            return $this->dispatcher->forward(
                array(
                    'controller' => 'website',
                    'action' => 'show'
                )
            );
        }
    }

    public function editAction($website_id)
    {
        $this->useDashboard('configDash');
        $this->view->website = Website::findFirst($website_id);
    }

    public function saveAction($website_id)
    {
        if($this->request->isPost()){

            $website = Website::findFirst($website_id);

            $website->website_name = $this->request->get("website_name");
            $website->website_status = $this->request->get("website_status");
            $website->website_template = $this->request->get("website_template");

            $website->save();
        }

        return $this->dispatcher->forward(
            array(
                'controller' => 'website',
                'action' => 'show',
                'params' => array($this->view->restaurant->restaurant_id)
            )
        );

    }

    public function deleteAction($website_id)
    {
        $this->useDashboard('configDash');

        $website = Website::findFirst($website_id);
        $this->view->website = $website;
        $this->view->restaurant_id = $website->restaurant_id;

    }

    public function deleteConfirmAction($restaurant_id, $website_id)
    {
        $this->db->delete(Website, "website_id=$website_id");
        return $this->dispatcher->forward(
            array(
                'controller' => 'website',
                'action' => 'show',
                'params' => array($restaurant_id)
            )
        );
    }

    public function themeOptionsAction($website_id)
    {

        $this->useDashboard('configDash');
        $this->view->website_id = $website_id;
        $this->view->website_meta_list = WebsiteMeta::findBywebsite_id($website_id);
    }

    public function themeOptionsAddAction($website_id)
    {
        $website_meta = new WebsiteMeta();
        $website_meta->website_id = $website_id;
        $website_meta->website_meta_key = " ";
        $website_meta->website_meta_value = " ";
        $website_meta->save();

        return $this->response->redirect("website/themeOptions/$website_id");
    }

    public function themeOptionsSaveAction($website_id)
    {

        foreach($this->request->getPost() as $name => $value){
            $meta_data = explode("-", $name);
            $meta_id = $meta_data[0];
            $meta_type = $meta_data[1];

            $website_meta = WebsiteMeta::findFirst(
                array(
                    "conditions" => "website_meta_id = '$meta_id'"
                )
            );

            if($meta_type == "key"){
                $website_meta->website_meta_key = $value;
            } elseif($meta_type == "value"){
                $website_meta->website_meta_value = $value;
            } else {
                return false;
            }

            $website_meta->save();
        }

        return $this->dispatcher->forward(
            array(
                'controller' => 'website',
                'action' => 'themeOptions',
                'params' => array($website_id)
            )
        );
    }

    public function themeOptionsDeleteAction($website_meta_id)
    {
        $website_meta = WebsiteMeta::findFirst($website_meta_id);
        $website_id = $website_meta->website_id;
        $this->db->delete(Website_Meta, "website_meta_id=$website_meta_id");

        return $this->response->redirect("website/themeOptions/$website_id");
    }
}

