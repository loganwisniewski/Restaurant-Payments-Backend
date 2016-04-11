<?php

use \Phalcon\Mvc\Model\Message as Message;

class User extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $user_id;

    /**
     *
     * @var string
     */
    public $user_name_first;

    /**
     *
     * @var string
     */
    public $user_name_last;

    /**
     *
     * @var string
     */
    public $user_phone;

    /**
     *
     * @var string
     */
    public $user_phone_other;

    /**
     *
     * @var string
     */
    public $user_registered;

    /**
     *
     * @var string
     */
    public $user_status;

    /**
     *
     * @var string
     */
    public $user_role;

    /**
     *
     * @var string
     */
    public $user_login;

    /**
     *
     * @var string
     */
    public $user_password;

    /**
     *
     * @var integer
     */
    public $restaurant_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'User'");
        $this->hasMany('user_id', 'UserMeta', 'user_id', array('alias' => 'UserMeta'));
        $this->belongsTo('restaurant_id', 'Restaurant', 'restaurant_id', array('alias' => 'Restaurant'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'User';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return User[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return User
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

    public function beforeSave()
    {

    }

}
