<?php

use Phalcon\Events\Event;
use Phalcon\Mvc\Dispatcher;
use Phalcon\Mvc\Dispatcher\Exception;

class ExceptionsPlugin {

    public function beforeException(Event $event, Dispatcher $dispatcher, $exception){

        // 404
        if($exception instanceof Exception){
            $dispatcher->forward(array(
                'controller' => 'error',
                'action' => 'error404'
            ));
        }

        // Other Exceptions
        $dispatcher->forward(array(
            'controller' => 'error',
            'action' => 'index'
        ));
    }
}