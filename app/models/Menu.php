<?php

class Menu extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $menu_id;

    /**
     *
     * @var string
     */
    public $menu_name;

    /**
     *
     * @var string
     */
    public $menu_post_date;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'Menu'");
        $this->hasMany('menu_id', 'Meal', 'menu_id', array('alias' => 'Meal'));
        $this->hasMany('menu_id', 'Restaurant', 'menu_id', array('alias' => 'Restaurant'));
        $this->hasMany('menu_id', 'RestaurantMenu', 'menu_id', array('alias' => 'RestaurantMenu'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Menu';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Menu[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Menu
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
