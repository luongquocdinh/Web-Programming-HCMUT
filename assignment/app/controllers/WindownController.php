<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model\Criteria;
use Phalcon\Paginator\Adapter\Model as Paginator;
use Phalcon\Forms\Form;
use Phalcon\Http\Request\File;


class WindownController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Manage your IOS');
        parent::initialize();
    }

    public function indexAction()
    {
    	$numberPage = $this->request->getQuery("page", "int", 1);
        $windown = Windown::find();
        $paginator = new Paginator(array(
            "data"=>$windown,
            "limit" => 12,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function searchAction() {
    	$this->session->conditions = null;
    	
        $this->view->form = new IosForm;
    }

    public function resultAction() {
    	$numberPage = 1;
        if ($this->request->isPost()) {
            $query = Criteria::fromInput($this->di, "Windown", $this->request->getPost());
            $this->persistent->searchParams = $query->getParams();
        } else {
            $numberPage = $this->request->getQuery("page", "int");
        }

        $parameters = array();
        if ($this->persistent->searchParams) {
            $parameters = $this->persistent->searchParams;
        }

        $windown = Windown::find($parameters);
        if (count($windown) == 0) {
            $this->flash->notice("The search did not find any windown");
            return $this->forward("windown/index");
        }

        $paginator = new Paginator(array(
            "data"  => $windown,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function detailAction($id){
		$form=new WindownForm();

		$windown = Windown::findFirstById($id);
		if (!$windown) {
			$response = new \Phalcon\Http\Response();
            return $response->redirect("index");
		}
				
		$this->view->windown = $windown;	
		$this->view->form = $form;
	}

    public function uploadAction() 
    {
    	$form = new WindownForm();
		
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
				$filename = 'windown'.$id."-".$nameFile.strtolower($upload->getname());
		
				$path = "temp/windown/$id/$nameFile/";
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

		    		$ios = new Windown();
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
							'controller' => 'windown',
							'action' => 'index'
						));
					} 
				}
			}	
		}
		$this->view->form = $form;	
    }
}