<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Forms\Form;
use Phalcon\Http\Request\File;


class AndroidController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Manage your IOS');
        parent::initialize();
    }

    public function indexAction()
    {
    	$numberPage = $this->request->getQuery("page", "int", 1);
        $android = Android::find();
        $paginator = new Paginator(array(
            "data"=>$android,
            "limit" => 12,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function searchAction() {
    	$this->session->conditions = null;
    	
        $this->view->form = new AndroidForm;
    }

    public function resultAction() {
    	$numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Android", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

        $android = Android::find($parameters);
        if (count($android) == 0) {
            $this->flash->notice("The search did not find any android");
            return $this->forward("android/index");
        }

        $paginator = new Paginator(array(
            "data"  => $android,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function detailAction($id){
		$form = new AndroidForm();

		$android = Android::findFirstById($id);
		if (!$android) {
			$response = new \Phalcon\Http\Response();
            return $response->redirect("index");
		}
				
		$this->view->android = $android;	
		$this->view->form = $form;
	}

    public function uploadAction() 
    {
    	$form = new AndroidForm();
		
		if($this->request->hasFiles() == true) {
			$linkImg;
			$linkApp;
			$uploads = $this->request->getUploadedFiles();
			$isUploaded = false;
			$auth = $this->session->get('auth');
			$id = $auth['id'];
			
			foreach($uploads as $upload) {
			
				$allowed =  array('gif','png' ,'jpg', 'webp');

				$nameFile = date("YmdHis");
				$filename = 'android'.$id."-".$nameFile.strtolower($upload->getname());
		
				$path = "temp/android/$id/$nameFile/";
				$path_parts = pathinfo($filename);
				$check_extension = $path_parts['extension'];
				if (in_array($check_extension,$allowed)) {
					if (!is_dir($path)) {
						mkdir($path, 0775, true);
						$path = $path . $filename;
						$linkImg = $path;
						($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
					} else {
						$path = $path . $filename;
						$linkImg = $path;
						($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
					}
				} else {
					if (!is_dir($path)) {
						mkdir($path, 0775, true);
						$path = $path . $filename;
						$linkApp = $path;
						($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
					} else {
						$path = $path . $filename;
						$linkApp = $path;
						($upload->moveTo($path)) ? $isUploaded = true : $isUploaded = false;
					}
				}
				
				if ($this->request->isPost()) {
		    		$name = $this->request->getPost("Name");
		    		$description = $this->request->getPost("Description");

		    		$ios = new Android();
					$ios->name = $name;
					$ios->description = $description;
					$ios->images = $linkImg;
					$ios->app = $linkApp;
					$ios->active = 'N';

					if ($ios->save() == false) {
						foreach ($ios->getMessages() as $message) 
		                {
		                    $this->flash->error((string) $message);
		                }
					} else {
						$this->tag->setDefault('name', '');
						$this->tag->setDefault('description', '');
						$this->flash->success('Upload successfully');
						$this->dispatcher->forward(array(
							'controller' => 'android',
							'action' => 'index'
						));
					} 
				}
			}	
		}
		$this->view->form = $form;	
    }
}