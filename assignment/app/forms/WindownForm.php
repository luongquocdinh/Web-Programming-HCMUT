<?php

use Phalcon\Forms\Form;
use Phalcon\Forms\Element\Text;
use Phalcon\Forms\Element\File;
use Phalcon\Forms\Element\TextArea;
use Phalcon\Forms\Element\Submit;
use Phalcon\Validation\Validator\PresenceOf;


class WindownForm extends Form
{
    public function initialize()
    {
        
        // Name
        $name = new Text('Name');
        $name->setLabel('Name');
        $name->addValidators(array(
            new PresenceOf(array(
                'message' => 'Name is required'
            ))
        ));
        $this->add($name);
        // Descreption
        $description = new TextArea('Description');
        $description->setLabel('Description');
        $description->addValidators(array(
            new PresenceOf(array(
                'message' => 'Please enter some descriptions'
            ))
        ));
        $this->add($description);
     	

     	$images = new File('Images');
		$images->setLabel('Images');
 		$this->add($images);

        $file = new File('File');
        $file->setLabel('File');
        $this->add($file);

 		$this->add(new Submit('Create', array(
 			'class' => 'btn btn-success'
 		)));
    }
}