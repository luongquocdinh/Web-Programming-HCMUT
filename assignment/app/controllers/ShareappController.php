<?php

use Phalcon\Flash;
use Phalcon\Session;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Forms\Form;
use Phalcon\Mvc\Model\Criteria;

class ShareappController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Manage your Share Application');
        parent::initialize();
    }

    public function indexAction()
    {
        
    }

    public function profileAction() {
    	//Get session info
        $auth = $this->session->get('auth');
        //Query the active user
        $user = Users::findFirst($auth['id']);
        if ($user == false) {
            return $this->forward('index/index');
        }

        if (!$this->request->isPost()) {
            $this->tag->setDefault('name', $user->name);
            $this->tag->setDefault('username', $user->username);
            $this->tag->setDefault('email', $user->email);
            $this->tag->setDefault('password', "");
            $this->tag->setDefault('repeatPassword', "");
        } else {

            $name = $this->request->getPost('name', array('string', 'striptags'));
            $username = $this->request->getPost('username', array('string', 'striptags'));
            $email = $this->request->getPost('email', 'email');
            $password = $this->request->getPost('password', 'password');
            $repeatPassword = $this->request->getPost('repeatPassword');

            if ($password != $repeatPassword) {
                $this->flash->error('Passwords are different');
                return false;
            }

            $user->name = $name;
            $user->username = $username;
            $user->email = $email;
            $user->password = sha1($password);
            if ($user->save() == false) {
                foreach ($user->getMessages() as $message) {
                    $this->flash->error((string) $message);
                }
            } else {
                $this->flash->success('Your profile information was updated successfully');
            }
        }
    }
}