<?php

use Phalcon\Mvc\User\Component;

/**
 * Elements
 *
 * Helps to build UI elements for the application
 */
class Elements extends Component
{

    private $_headerMenu = array(
        'navbar-left' => array(
            'index' => array(
                'caption' => 'Home',
                'action' => 'index'
            ),
            'about' => array(
                'caption' => 'About',
                'action' => 'index'
            ),
            'shareapp' => array(
                'caption' => 'Share App',
                'action' => 'index'
            ),
            'admin' => array(
                'caption' => 'Manage',
                'action' => 'index'
            )
        ),
        'navbar-right' => array(
            'session' => array(
                'caption' => 'Log In/Sign Up',
                'action' => 'index'
            ),
        )
    );

    private $_tabs = array(
        'Share App' => array(
            'controller' => 'shareapp',
            'action' => 'index',
            'any' => false
        ),
        'Android' => array(
            'controller' => 'android',
            'action' => 'index',
            'any' => true
        ),
        'IOS' => array(
            'controller' => 'ios',
            'action' => 'index',
            'any' => true
        ),
        'Windown Phone' => array(
            'controller' => 'windown',
            'action' => 'index',
            'any' => true
        ),
        'Your Profile' => array(
            'controller' => 'shareapp',
            'action' => 'profile',
            'any' => false
        )
    );

    /**
     * Builds header menu with left and right items
     *
     * @return string
     */
    public function getMenu()
    {

        $auth = $this->session->get('auth');
        if ($auth && $auth['role'] != 'admin') {
            $this->_headerMenu['navbar-right']['session'] = array(
                'caption' => 'Log Out',
                'action' => 'end'
            );
            unset($this->_headerMenu['navbar-left']['admin']);
        } else if ($auth['role'] == 'admin') {
            $this->_headerMenu['navbar-right']['session'] = array(
                'caption' => 'Log Out',
                'action' => 'end'
            );
            unset($this->_headerMenu['navbar-left']['shareapp']);
        } else if ($auth) {
            $this->_headerMenu['navbar-right']['session'] = array(
                'caption' => 'Log Out',
                'action' => 'end'
            );
            unset($this->_headerMenu['navbar-left']['admin']);
        } else {
            unset($this->_headerMenu['navbar-left']['shareapp']);
            unset($this->_headerMenu['navbar-left']['admin']);
        }

        $controllerName = $this->view->getControllerName();
        foreach ($this->_headerMenu as $position => $menu) {
            echo '<div class="nav-collapse">';
            echo '<ul class="nav navbar-nav ', $position, '">';
            foreach ($menu as $controller => $option) {
                if ($controllerName == $controller) {
                    echo '<li class="active">';
                } else {
                    echo '<li>';
                }
                echo $this->tag->linkTo($controller . '/' . $option['action'], $option['caption']);
                echo '</li>';
            }
            echo '</ul>';
            echo '</div>';
        }
    }

    /**
     * Returns menu tabs
     */
    public function getTabs()
    {
        $controllerName = $this->view->getControllerName();
        $actionName = $this->view->getActionName();
        echo '<ul class="nav nav-tabs">';
        foreach ($this->_tabs as $caption => $option) {
            if ($option['controller'] == $controllerName && ($option['action'] == $actionName || $option['any'])) {
                echo '<li class="active">';
            } else {
                echo '<li>';
            }
            echo $this->tag->linkTo($option['controller'] . '/' . $option['action'], $caption), '</li>';
        }
        echo '</ul>';
    }
}
