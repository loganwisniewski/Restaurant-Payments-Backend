<?php

class Media extends \Phalcon\Mvc\Model
{

    /**
     *
     * @var integer
     */
    public $media_id;

    /**
     *
     * @var string
     */
    public $media_name;

    /**
     *
     * @var string
     */
    public $media_ext;

    /**
     *
     * @var string
     */
    public $media_date;

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
        $this->setSource("'Media'");
        $this->belongsTo('restaurant_id', 'Restaurant', 'restaurant_id', array('alias' => 'Restaurant'));
    }

    /**
     * Returns table name mapped in the model.
     *
     * @return string
     */
    public function getSource()
    {
        return 'Media';
    }

    /**
     * Allows to query a set of records that match the specified conditions
     *
     * @param mixed $parameters
     * @return Media[]
     */
    public static function find($parameters = null)
    {
        return parent::find($parameters);
    }

    /**
     * Allows to query the first record that match the specified conditions
     *
     * @param mixed $parameters
     * @return Media
     */
    public static function findFirst($parameters = null)
    {
        return parent::findFirst($parameters);
    }

}
