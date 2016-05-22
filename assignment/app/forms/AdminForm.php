<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\Numeric;
use Phalcon\Forms\Elemen;

class AdminForm extends Form {
	public function initialize() {

		if (!isset($options['editUser'])) {
            $element = new Text("id");
            $this->add($element->setLabel("Id"));
        } else {
            $this->add(new Hidden("id"));
        }

		$name = new Text('name');
		$name->setLabel('Name');
		$this->add($name);

		$username = new Text('username');
		$username->setLabel('Username');
		$this->add($username);

		$email = new Text('email');
		$email->setLabel('Email');
		$this->add($email);

		$role = new Text('role');
		$role->setLabel('Role');
		$this->add($role);
	}
}