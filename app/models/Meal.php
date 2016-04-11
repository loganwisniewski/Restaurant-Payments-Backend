<?php

class Meal extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $meal_id;

    /**
     *
     * @var string
     */
    public $meal_type;

    /**
     *
     * @var integer
     */
    public $meal_order;

    /**
     *
     * @var string
     */
    public $meal_name;

    /**
     *
     * @var string
     */
    public $meal_description;

    /**
     *
     * @var double
     */
    public $meal_price;

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
        $this->setSource("'Meal'");
        $this->hasMany('meal_id', 'CartItem', 'meal_id', array('alias' => 'CartItem'));
        $this->hasMany('meal_id', 'MealParam', 'meal_id', array('alias' => 'MealParam'));
        $this->belongsTo('menu_id', 'Menu', 'menu_id', array('alias' => 'Menu'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Meal';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Meal[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Meal
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
