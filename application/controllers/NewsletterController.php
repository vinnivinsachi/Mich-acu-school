<?php

	class NewsletterController extends CustomControllerAction
	{
		public $goodURL='';
		
		public function init(){
			parent::init();
		}
	
		public function preDispatch()
		{
			parent::preDispatch();	
		}
	
	
		public function indexAction()
		{
			
			$newsletterSubscribers = DatabaseObject_Helper_NewsletterManager::loadAllSubscribers($this->db);
			Zend_Debug::Dump($newsletterSubscribers);
			$this->view->newsletterSubscribers = $newsletterSubscribers;
			//$this->breadcrumbs->addStep('Dancewear Rialto', $this->getUrl(null, 'index'));
			//echo 'first leg';
			//$this->view->layout =''
		}
		
		public function markascameAction()
		{
			$request = $this->getRequest();
			$id=$request->getParam('id');
			
			DatabaseObject_Helper_NewsletterManager::setSubscriberAsCame($this->db, $id);
			$this->messenger->addMessage('You have marked id: '.$id.' as came');
			$this->_redirect($_SERVER['HTTP_REFERER']);
		}
		
		public function markasuncameAction()
		{
			$request = $this->getRequest();
			$id=$request->getParam('id');
			
			DatabaseObject_Helper_NewsletterManager::setSubscriberAsUnCame($this->db, $id);
			$this->messenger->addMessage('You have marked id: '.$id.' as NOT came');
			$this->_redirect($_SERVER['HTTP_REFERER']);
		}
		
}
?>