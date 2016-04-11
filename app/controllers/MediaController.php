<?php

class MediaController extends ControllerBase
{

    public function indexAction()
    {
        $this->dispatcher->forward(array(
            "controller"=>"media",
            "action"=>"upload"
        ));
    }

    public function showAction($restaurant_id)
    {
        $this->useDashboard('configDash');
        $this->view->media = Media::findByrestaurant_id($restaurant_id);

        $this->view->restaurant_guid = Restaurant::findFirst($restaurant_id)->restaurant_guid;
    }

    public function uploadAction()
    {
        $this->useDashboard('configDash');
    }

    public function uploadExecuteAction($restaurant_id)
    {
        $restaurant_guid = Restaurant::findFirst($restaurant_id)->restaurant_guid;


        $this->useDashboard('configDash');
        // Check if the user has uploaded files
        if ($this->request->hasFiles()) {

            // Print the real file names and sizes
            foreach ($this->request->getUploadedFiles() as $file) {
                // Move the file into the application
                $file_name = $file->getName();
                if($file->moveTo('../public/files/restaurants/'. $restaurant_guid .'/' . $file_name)){
                    $media = new Media();
                    $media->media_name = $file_name;
                    $media->media_ext = $file->getExtension();
                    $media->restaurant_id = $restaurant_id;
                    $media->save();
                }
            }
        }

    }
}

