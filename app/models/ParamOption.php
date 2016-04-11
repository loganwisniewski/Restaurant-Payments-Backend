<?php

class ParamOption extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $param_option_id;

    /**
     *
     * @var string
     */
    public $param_option_name;

    /**
     *
     * @var string
     */
    public $param_option_title;

    /**
     *
     * @var double
     */
    public $param_option_price;

    /**
     *
     * @var integer
     */
    public $param_option_order;

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
        $this->setSource("'Param_Option'");
        $this->hasMany('param_option_id', 'CartItemOption', 'param_option_id', array('alias' => 'CartItemOption'));
        $this->belongsTo('param_id', 'Param', 'param_id', array('alias' => 'Param'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Param_Option';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return ParamOption[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return ParamOption
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
