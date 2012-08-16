<?php
	/**account**
	*AdminAccount is the master account that manages all network flow. 
	*/
	class AdminaccountController extends CustomControllerAction
	{	
	
		/*init**********
		*initializes all the variables necessary for this control
		*heavily rely on $this->userObject instantiated and loaded in CustomController
		*uses $this->signedInUserSessionInfoHolder instantiated and loaded in customController
		*sets up breadcrumbs for all the actions
		****************/
		public function init(){
			parent::init();
		}
		
		/*init*********
		*checks to see if the user is logged in
		*loads all the shipping information of a user into a session variables
		***************/
		public function preDispatch(){				
			parent::preDispatch();	
			if($this->auth->hasIdentity()){
			} 
		}
	
		/*index***********
		*displays everything there is that is in the session variable
		******************/
		public function indexAction(){
			$this->view->signedInUser=$this->signedInUserSessionInfoHolder;
		}
		
		public function usersAction(){
			
			$this->request = $this->getRequest();
			
			$this->email = $this->request->getParam('email');
			$this->usertype = $this->request->getParam('type');
			//echo $this->request->getParam('variable');
			if(isset($this->email)){
					$user = new DatabaseObject_User($this->db);
					echo 'here';
					$user->loadByEmail($this->email);
					$this->view->currentUser =$user;
					Zend_Debug::dump($user);
			}
			
			if(isset($this->usertype)){
				
				echo 'here2';
				$usertype = DatabaseObject_Helper_Admin_UserManager::loadAllUsers($this->db, $this->usertype);
				$this->view->usertype = $usertype;
				Zend_Debug::dump($usertype);
			}
			
			
			//$generalSellers = DatabaseObject_Helper_Admin_UserManager::loadAllUsers($this->db, 'generalSeller');
			//$storeSellers = DatabaseObject_Helper_Admin_UserManager::loadAllUsers($this->db, 'storeSeller');
			//$members = DatabaseObject_Helper_Admin_UserManager::loadAllUsers($this->db, 'member');
			
			//$this->view->generalSellers = $generalSellers;
		
		}
		
		
		public function systemvariablesAction(){
			
		}
		
		public function promotionsAction(){
				
		}
	}
?>