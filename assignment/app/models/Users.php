<?php

use Phalcon\Mvc\Model;
use Phalcon\Validation;
use Phalcon\Mvc\Model\Validator\Email as EmailValidator;
use Phalcon\Mvc\Model\Validator\Uniqueness as UniquenessValidator;

class Users extends Model
{
    public $id;

    public $name;

    public $username;

    public $email;

    public $role;
    
    public function validation()
    {
        $validator = new Validation();

        $validator->validate(new EmailValidator(array(
            'field' => 'email'
        )));
        $validator->validate(new UniquenessValidator(array(
            'field' => 'email',
            'message' => 'Sorry, The email was registered by another user'
        )));
        $validator->validate(new UniquenessValidator(array(
            'field' => 'username',
            'message' => 'Sorry, That username is already taken'
        )));
        if ($this->validationHasFailed() == true) {
            return false;
        }

        return $this->validate($validator);
    }
}
