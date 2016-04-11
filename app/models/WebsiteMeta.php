<?php

class WebsiteMeta extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $website_meta_id;

    /**
     *
     * @var string
     */
    public $website_meta_key;

    /**
     *
     * @var string
     */
    public $website_meta_value;

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
        $this->setSource("'Website_Meta'");
        $this->belongsTo('website_id', 'Website', 'website_id', array('alias' => 'Website'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Website_Meta';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return WebsiteMeta[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return WebsiteMeta
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
