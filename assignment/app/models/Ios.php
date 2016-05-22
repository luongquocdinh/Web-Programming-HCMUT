<?php

use Phalcon\Mvc\Model;

class Ios extends Model {
	public $id;

	public $name;

	public $description;

	public $images;

	public $app;

	public $active;

	public function initialize()
	{
		$this->belongsTo('id', 'Ios', 'id', array(
			'reusable' => true
		));
	}
}