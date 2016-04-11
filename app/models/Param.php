<?php

class Param extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $param_id;

    /**
     *
     * @var string
     */
    public $param_slug;

    /**
     *
     * @var string
     */
    public $param_title;

    /**
     *
     * @var string
     */
    public $param_description;

    /**
     *
     * @var string
     */
    public $param_type;

    /**
     *
     * @var integer
     */
    public $param_required;

    /**
     *
     * @var string
     */
    public $param_on_change;

    /**
     *
     * @var string
     */
    public $param_default;

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
        $this->setSource("'Param'");
        $this->hasMany('param_id', 'MealParam', 'param_id', array('alias' => 'MealParam'));
        $this->hasMany('param_id', 'ParamOption', 'param_id', array('alias' => 'ParamOption'));
        $this->belongsTo('restaurant_id', 'Restaurant', 'restaurant_id', array('alias' => 'Restaurant'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Param';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Param[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Param
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
