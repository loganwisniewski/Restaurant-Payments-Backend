<?php

defined('APP_PATH') || define('APP_PATH', realpath('.'));



return new \Phalcon\Config(array(
    'database' => array(
        'adapter'     => 'Mysql',
        'host'        => 'localhost',
        'username'    => 'admin',
        'password'    => 'password',
        'dbname'      => 'test_chef',
        'charset'     => 'utf8',
    ),
    'application' => array(
        'controllersDir' => APP_PATH . '/app/controllers/',
        'modelsDir'      => APP_PATH . '/app/models/',
        'migrationsDir'  => APP_PATH . '/app/migrations/',
        'viewsDir'       => APP_PATH . '/app/views/',
        'pluginsDir'     => APP_PATH . '/app/plugins/',
        'libraryDir'     => APP_PATH . '/app/library/',
        'cacheDir'       => APP_PATH . '/app/cache/',
        'baseUri'        => '/WebChef/',
    ),
    'pup' => array(
        'redirect' => array(
            'success' => 'user/profile',
            'failure' => 'user/login'
        ),
        'resources' => array(
            'type' => 'private',
            'resources' => array(
                'user' => array('account', 'profile')
            )
        )
    )
));
