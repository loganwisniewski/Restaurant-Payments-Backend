<?php

class Website extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $website_id;

    /**
     *
     * @var string
     */
    public $website_name;

    /**
     *
     * @var string
     */
    public $website_status;

    /**
     *
     * @var integer
     */
    public $website_template;

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
        $this->setSource("'Website'");
        $this->hasMany('website_id', 'WebsiteMeta', 'website_id', array('alias' => 'WebsiteMeta'));
        $this->belongsTo('restaurant_id', 'Restaurant', 'restaurant_id', array('alias' => 'Restaurant'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Website';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Website[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Website
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
