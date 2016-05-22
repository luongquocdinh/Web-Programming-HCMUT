<?php

use Phalcon\Mvc\Model;

class Android extends Model {
	public $id;

	public $name;

	public $description;

	public $images;

	public $app;

	public $active;

	public function initialize()
	{
		$this->belongsTo('id', 'Android', 'id', array(
			'reusable' => true
		));
	}
}