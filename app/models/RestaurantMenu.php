<?php

class RestaurantMenu extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $restaurant_id;

    /**
     *
     * @var integer
     */
    public $menu_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'Restaurant_Menu'");
        $this->belongsTo('menu_id', 'Menu', 'menu_id', array('alias' => 'Menu'));
        $this->belongsTo('restaurant_id', 'Restaurant', 'restaurant_id', array('alias' => 'Restaurant'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Restaurant_Menu';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return RestaurantMenu[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return RestaurantMenu
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
