<?php

class WebchefMeta extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $webchef_meta_id;

    /**
     *
     * @var string
     */
    public $webchef_meta_key;

    /**
     *
     * @var string
     */
    public $webchef_meta_value;

    /**
     * Initialize method for model.
     */
    public function initialize()
    {
        $this->setSource("'WebChef_Meta'");
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'WebChef_Meta';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return WebchefMeta[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return WebchefMeta
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
