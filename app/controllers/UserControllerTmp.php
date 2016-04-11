<?php

class UserControllerTmp extends ControllerBase
{

    public function indexAction()
    {

    }

    public function newAction($restaurant_id)
    {

        $this->view->setTemplateAfter("adminDash");

        if($_POST){
            $user = new User();

            $user->user_name_first = $this->request->get("user_name_first");
            if($this->request->get("user_name_last") != null){
                $user->user_name_last = $this->request->get("user_name_last");
            }
            $user->user_phone = $this->request->get("user_phone");
            $user->user_phone_other = $this->request->get("user_phone_other");
            $user->user_login = $this->request->get("user_login");
            $password = $this->request->get("user_password");
            $password_verify = $this->request->get("user_password_verify");

            $user->user_password = $this->security->hash($password);
            $user->user_registered = new Phalcon\Db\RawValue('now()');
            $user->user_status = "active";

            $user->restaurant_id = $restaurant_id;


            if(!$user->save()){
                $messages = $user->getMessages();
                foreach($messages as $message){
                    $this->flash->error($message);
                }
            } else {
                $this->flash->success("Successfull New User");
            }

        }
    }

    public function showAction($restaurant_id = null)
    {
        $this->useDashboard('adminDash');

        if($restaurant_id == null){
            $this->view->users = User::find(array(
                "conditions" => "restaurant_id IS null"
            ));
        } else {
            $this->view->users = User::find(array(
                "conditions" => "restaurant_id = :rest_id:",
                "bind" => ['rest_id' => $restaurant_id]
            ));
        }
    }

    public function editAction($user_id)
    {
        $this->useDashboard('adminDash');
        $this->view->user = User::findFirst($user_id);
    }

    public function saveAction($user_id)
    {
        if($this->request->isPost()){

            $user = User::findFirst($user_id);

            $user->user_name_first = $this->request->get("user_name_first");
            $user->user_name_last = $this->request->get("user_name_last");
            $user->user_phone = $this->request->get("user_phone");
            $user->user_phone_other = $this->request->get("user_phone_other");
            $user->user_login = $this->request->get("user_login");
            $password = $this->request->get("user_password");
            $password_verify = $this->request->get("user_password_verify");

            if($password != $password_verify){
                $this->flash->error("Mismatching passwords.. <small>(doesn't affect other saved fields)</small>");
            } elseif($password != ""){
                $user->user_password = $this->security->hash($password);
            }



            if(!$user->save()){
                $messages = $user->getMessages();
                foreach($messages as $message){
                    $this->flash->error($message);
                }
            } else {
                $this->flash->success("Successfully Saved!");
            }

            return $this->dispatcher->forward(array(
                'action' => 'edit'
            ));
        }
    }



}

