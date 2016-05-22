<?php

use Phalcon\Paginator\Adapter\Model as Paginator;

class IndexController extends ControllerBase
{
    public function initialize()
    {
        $this->tag->setTitle('Welcome');
        parent::initialize();
    }

    public function indexAction()
    {
        $numberPage = $this->request->getQuery("page", "int", 1);
        $ios = Ios::find();
        $paginator = new Paginator(array(
            "data"=>$ios,
            "limit" => 12,
            "page" => $numberPage
        ));

        $this->view->page = $paginator->getPaginate();
    }
}
