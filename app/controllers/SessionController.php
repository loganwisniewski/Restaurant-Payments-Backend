<?php

class SessionController extends ControllerBase
{

    public function indexAction()
    {

    }

    public function loginAction()
    {
       if($_POST) {
           $login = $this->request->getPost('user_login');
           $password = $this->request->getPost('user_password');

           $user = User::findFirstByuser_login($login);
           if ($user) {
               if ($this->security->checkHash($password, $user->user_password)) {
                   // The validation success
                   $this->session->set("user", $user);
                   return $this->dispatcher->forward(array(
                       'controller' => 'index',
                       'action' => 'index'
                   ));
               }
           } else {
               $this->flash->error("User not found...");
               return;
           }

           // The validation has failed
           $this->flash->error("Wrong username or <u>password</u>!");
       }
    }

    public function logoutAction()
    {
        $this->session->destroy();
        $this->dispatcher->forward(array(
            'action' => 'login'
        ));
    }

}

