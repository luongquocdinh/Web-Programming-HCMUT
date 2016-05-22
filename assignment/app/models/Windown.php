<?php

use Phalcon\Mvc\Model;

class Windown extends Model {
	public $id;

	public $name;

	public $description;

	public $images;

	public $app;

	public $active;

	public function initialize()
	{
		$this->belongsTo('id', 'Windown', 'id', array(
			'reusable' => true
		));
	}
}