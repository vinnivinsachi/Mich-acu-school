<?php


	
	class InventorymanagerController extends CustomControllerAction
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
			
			if($this->getRequest()->isPost()){
				$code = $this->getRequest()->getParam('code');
				
				$codeArray=explode('-', $code);
				$category=substr($codeArray[0], 0,1);
				$inventory['style']=$this->productConfig['inventoryCode'][$category]['style'];
				$inventory['tag']=$this->productConfig['inventoryCode'][$category]['tag'];
				$inventory['code']=$code;
				$inventory['metric']=$codeArray[1];
				$inventory['size']=$codeArray[2];
				Zend_Debug::dump($inventory);
				DatabaseObject_Helper_InventoryManager::addsimpleinventory($this->db, $inventory);
				$this->_redirect($_SERVER['HTTP_REFERER']);

			}else{
			
			$param['size']=$this->getRequest()->getParam('size');
			$param['style']=$this->getRequest()->getParam('style');
			$param['tag']=$this->getRequest()->getParam('tag');
			$param['order']=$this->getRequest()->getParam('order');
			
			$inventory=DatabaseObject_Helper_InventoryManager::retrieveAllInventory($this->db, $param);
			$this->view->inventories =$inventory;
			Zend_Debug::dump($inventory);
			}
		}
		
		public function checkinAction(){
		
		
		}
		
		public function checkoutAction(){
			$param['id']=$this->getRequest()->getParam('id');
			DatabaseObject_Helper_InventoryManager::removeSimpleInventory($this->db, $param);
			$this->_redirect($_SERVER['HTTP_REFERER']);

		}
		
}
?>