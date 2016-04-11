<?php

class Restaurant extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $restaurant_id;

    /**
     *
     * @var string
     */
    public $restaurant_guid;

    /**
     *
     * @var string
     */
    public $restaurant_name;

    /**
     *
     * @var string
     */
    public $restaurant_address;

    /**
     *
     * @var string
     */
    public $restaurant_city;

    /**
     *
     * @var string
     */
    public $restaurant_state;

    /**
     *
     * @var integer
     */
    public $restaurant_zip;

    /**
     *
     * @var string
     */
    public $restaurant_phone;

    /**
     *
     * @var string
     */
    public $restaurant_email;

    /**
     *
     * @var string
     */
    public $restaurant_gmt;

    /**
     *
     * @var double
     */
    public $restaurant_tax;

    /**
     *
     * @var string
     */
    public $restaurant_status;

    /**
     *
     * @var string
     */
    public $restaurant_cuisine;

    /**
     *
     * @var integer
     */
    public $menu_id;

    /**
     *
     * @var integer
     */
    public $website_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'Restaurant'");
        $this->hasMany('restaurant_id', 'Media', 'restaurant_id', array('alias' => 'Media'));
        $this->hasMany('restaurant_id', 'RestaurantMenu', 'restaurant_id', array('alias' => 'RestaurantMenu'));
        $this->hasMany('restaurant_id', 'User', 'restaurant_id', array('alias' => 'User'));
        $this->hasMany('restaurant_id', 'Website', 'restaurant_id', array('alias' => 'Website'));
        $this->belongsTo('menu_id', 'Menu', 'menu_id', array('alias' => 'Menu'));
        $this->belongsTo('website_id', 'Website', 'website_id', array('alias' => 'Website'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Restaurant';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Restaurant[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Restaurant
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
