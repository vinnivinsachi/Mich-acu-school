<?php
	/**account**
	*ALL account actions must be required to sign in!
	*/
	class OrderadministrationController extends CustomControllerAction
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
			$orders = DatabaseObject_Helper_Orderadministration::retrieveallorders($this->db);
			Zend_Debug::dump($orders);
			$this->view->orders = $orders;
			
		}
		
		public function detailsAction(){
			$orderUniqueId = $this->getRequest()->getParam('id');
			
			$order = new DatabaseObject_Order($this->db);
			
			if($orderUniqueId !=''){
				if($order->loadOrderByUniqueID($orderUniqueId)){
					$this->view->order = $order;
					$order->loadOrderProducts();
					$this->view->products =$order->products;
					
					$notes = DatabaseObject_Helper_Orderadministration::retrieveNotesForOrders($this->db, $orderUniqueId);
					$this->view->notes = $notes;
				}
			}
		}
		
		public function submittrackingAction(){
			$request = $this->getRequest();
			$id = $request->getParam('id');
			$tracking = $request->getParam('tracking');
			$order = new DatabaseObject_Order($this->db);
			
			if($tracking!='' && $tracking!='Tracking number'){
				if($id !=''){
					if($order->loadOrderByUniqueID($id)){
						$order->tracking=$tracking;
						$order->save();
						$this->messenger->addMessage('Order tracking added');
						$this->_redirect($_SERVER['HTTP_REFERER']);
					}
				}
			}
			
		}
		
		public function submitnotesfororderAction(){
			$request = $this->getRequest();
			$id = $request->getParam('id');
			$text = $request->getParam('notes');
			
			if($text!='' && $text!='Notes:'){
				$notes = new DatabaseObject_OrderProfileSimpleNotes($this->db);
				$notes->order_unique_id	=$id;
				$notes->notes=$text;
				$notes->save();
				$this->messenger->addMessage('Notes added to order');
				$this->_redirect($_SERVER['HTTP_REFERER']);
			}
		}
		
		public function deletenotesAction(){
			$request = $this->getRequest();
			$id = $request->getParam('id');	
			
			$notes = new DatabaseObject_OrderProfileSimpleNotes($this->db);
			if($id !=''){
				if($notes->load($id)){

					$notes->delete();	
					$this->messenger->addMessage('Notes deleted from order');
					$this->_redirect($_SERVER['HTTP_REFERER']);
				}
			}
			
		}
	}
?>