<?php
	/**account**
	*ALL account actions must be required to sign in!
	*/
	class OrdermanagerController extends CustomControllerAction
	{	
		/*init**********
		*initializes all the variables necessary for this control
		
		****************/
		public function init(){
			parent::init();
			$this->breadcrumbs->addStep('Ordermanager', $this->getUrl(null, 'account'));
		}
		
		/*init*********
		*checks to see if the user is logged in
		*loads all the shipping information of a user into a session variables
		***************/
		public function preDispatch(){					
			parent::preDispatch();	
			
		}
	
		/*index***********
		 * summary
		******************/
		public function indexAction(){
			
		}
		
		
		public function ordersAction(){
			
		
			
		}
		
		//this is only available to sellers
		public function soldordersAction(){
		
		}
		
		public function guestordersAction(){
			$orderUniqueId = $this->getRequest()->getParam('id');
			
			$order = new DatabaseObject_Order($this->db);
			
			if($orderUniqueId !=''){
				if($order->loadOrderByUniqueID($orderUniqueId)){
					$this->view->order = $order;
					$order->loadOrderProducts();
					$this->view->products =$order->products;
				}
			}
			//Zend_Debug::dump($order);
		}
		
		
		public function testAction()
		{
			
		}	
	}
?>