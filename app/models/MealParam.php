<?php

class MealParam extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $meal_param_id;

    /**
     *
     * @var integer
     */
    public $meal_param_order;

    /**
     *
     * @var integer
     */
    public $meal_id;

    /**
     *
     * @var integer
     */
    public $param_id;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'Meal_Param'");
        $this->belongsTo('meal_id', 'Meal', 'meal_id', array('alias' => 'Meal'));
        $this->belongsTo('param_id', 'Param', 'param_id', array('alias' => 'Param'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Meal_Param';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return MealParam[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return MealParam
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
