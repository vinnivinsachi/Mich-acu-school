<?php


	
	class InventoryController extends CustomControllerAction
	{
		public $goodURL='';
		
		public function init(){
			parent::init();
		}
	
		public function preDispatch()
		{
			parent::preDispatch();	
			$this->view->basicURL=parent::modifyURL();
		}
	
	
		public function indexAction()
		{
			//$this->breadcrumbs->addStep('Dancewear Rialto', $this->getUrl(null, 'index'));
			//echo 'first leg';
			//$this->view->layout =''
		}
		
		public function checkinAction(){
		
		
		}
		
		public function checkoutAction(){
			
		}
		
}
?>