<?php

use Phalcon\Mvc\Controller;
use Phalcon\Mvc\Model\Query;
use Phalcon\Paginator\Adapter\Model as Paginator;


class AdminController extends ControllerBase {

	public function indexAction() {
        
	}

    ///////////// User //////////////////
	public function userAction() {
		
		$numberPage = $this->request->getQuery("page", "int", 1);
		$user = Users::find();
		$paginator = new Paginator(array(
            "data"  => $user,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();	
	}

	public function deleteUserAction($id)
    {

        $user = Users::findFirstById($id);
        if (!$user) {
            $this->flash->error("User was not found");
            return $this->forward("admin/user");
        }

        if (!$user->delete()) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward("admin/user");
        }

        $this->flash->success("User was deleted");
        return $this->forward("admin/user");
    }

    public function editUserAction($id) {
    	if (!$this->request->isPost()) {

            $user = Users::findFirstById($id);
            if (!$user) {
                $this->flash->error("User was not found");
                return $this->forward("admin/user");
            }

            $this->view->form = new AdminForm($user, array('edit' => true));
        }
    }

    public function saveAction() {
    	if (!$this->request->isPost()) {
            return $this->forward("admin/index");
        }

        $id = $this->request->getPost("id", "int");

        $user = Users::findFirstById($id);
        if (!$user) {
            $this->flash->error("User does not exist");
            return $this->forward("admin/user");
        }

        $form = new AdminForm;
        $this->view->form = $form;

        $data = $this->request->getPost();

        if (!$form->isValid($data, $user)) {
            foreach ($form->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('admin/editUser/' . $id);
        }

        if ($user->save() == false) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward('admin/editUser/' . $id);
        }

        $form->clear();

        $this->flash->success("User was updated successfully");
        return $this->forward("admin/user");
    }

    //////////////// IOS /////////////////////
	public function uploadIosAction() {
		$numberPage = $this->request->getQuery("page", "int", 1);
        $ios = Ios::find();
        $paginator = new Paginator(array(
            "data"  => $ios,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
	}

    public function addIosAction($id) {
        $upload = Ios::findFirstById($id);
        $sql = "UPDATE ios SET active = 'Y' WHERE id = $upload->id";
        //var_dump($sql);die;
        $this->di->get('db')->execute($sql);
        $this->flash->success("Add successfully");
        return $this->forward("admin/uploadios");
    }

    public function deleteIosAction($id) {
        $upload = Ios::findFirstById($id);
        if (!$upload) {
            $this->flash->error("User was not found");
            return $this->forward("admin/uploadios");
        }

        if (!$upload->delete()) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward("admin/uploadios");
        }

        $this->flash->success("Upload was deleted");
        return $this->forward("admin/uploadios");
    }


    public function downloadIosAction($id) {
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
        $path = Ios::findFirstById($id);
        $file = $path->app;
        $filename = substr($path->app, 26);
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header('Content-Description: File Transfer');
        header('Content-type: application/exe' );
        //header('Content-length: ' . $filesize);
        header('Content-Disposition: attachment; filename="'.$filename.'"');
        readfile($file);
        die();
    }

    //////////////////// Android //////////////////
    public function uploadAndroidAction() {
        $numberPage = $this->request->getQuery("page", "int", 1);
        $android = Android::find();
        $paginator = new Paginator(array(
            "data"  => $android,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function addAndroidAction($id) {
        $upload = Android::findFirstById($id);
        $sql = "UPDATE android SET active = 'Y' WHERE id = $upload->id";
        //var_dump($sql);die;
        $this->di->get('db')->execute($sql);
        $this->flash->success("Add successfully");
        return $this->forward("admin/uploadandroid");
    }

    public function deleteAndroidAction($id) {
        $upload = Android::findFirstById($id);
        if (!$upload) {
            $this->flash->error("User was not found");
            return $this->forward("admin/uploadandroid");
        }

        if (!$upload->delete()) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward("admin/uploadandroid");
        }

        $this->flash->success("Upload was deleted");
        return $this->forward("admin/uploadandroid");
    }


    public function downloadAndroidAction($id) {
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
        $path = Android::findFirstById($id);
        $file = $path->app;
        $filename = substr($path->app, 26);
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header('Content-Description: File Transfer');
        header('Content-type: application/exe' );
        //header('Content-length: ' . $filesize);
        header('Content-Disposition: attachment; filename="'.$filename.'"');
        readfile($file);
        die();
    }

    /////////////////// Windown ///////////////////////
    public function uploadWindownAction() {
        $numberPage = $this->request->getQuery("page", "int", 1);
        $windown = Windown::find();
        $paginator = new Paginator(array(
            "data"  => $windown,
            "limit" => 10,
            "page"  => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }

    public function addWindownAction($id) {
        $upload = Windown::findFirstById($id);
        $sql = "UPDATE windown SET active = 'Y' WHERE id = $upload->id";
        //var_dump($sql);die;
        $this->di->get('db')->execute($sql);
        $this->flash->success("Add successfully");
        return $this->forward("admin/uploadwindown");
    }

    public function deleteWindownAction($id) {
        $upload = Windown::findFirstById($id);
        if (!$upload) {
            $this->flash->error("User was not found");
            return $this->forward("admin/uploadwindown");
        }

        if (!$upload->delete()) {
            foreach ($user->getMessages() as $message) {
                $this->flash->error($message);
            }
            return $this->forward("admin/uploadwindown");
        }

        $this->flash->success("Upload was deleted");
        return $this->forward("admin/uploadwindown");
    }


    public function downloadWindownAction($id) {
        $this->view->setRenderLevel(\Phalcon\Mvc\View::LEVEL_NO_RENDER);
        $path = Windown::findFirstById($id);
        $file = $path->app;
        $filename = substr($path->app, 26);
        header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
        header('Content-Description: File Transfer');
        header('Content-type: application/exe' );
        //header('Content-length: ' . $filesize);
        header('Content-Disposition: attachment; filename="'.$filename.'"');
        readfile($file);
        die();
    }
}