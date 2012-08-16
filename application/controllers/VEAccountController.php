<?php
	/**account**
	*ALL account actions must be required to sign in!
	*/
	class VEAccountController extends CustomControllerAction
	{	
		/*init**********
		*initializes all the variables necessary for this control
		*heavily rely on $this->userObject instantiated and loaded in CustomController
		*uses $this->signedInUserSessionInfoHolder instantiated and loaded in customController
		*sets up breadcrumbs for all the actions
		****************/
		public function init(){
			parent::init();
			$this->breadcrumbs->addStep('Account', $this->getUrl(null, 'account'));
		}
		
		/*init*********
		*checks to see if the user is logged in
		*loads all the shipping information of a user into a session variables
		***************/
		public function preDispatch(){					
			parent::preDispatch();	
			
			//Zend_Debug::dump($_SERVER);
		}
	
		/*index***********
		*displays everything there is that is in the session variable
		******************/
		public function indexAction(){
			
		}
		
		
		public function detailsAction(){				
			
		}
		
		
		public function verifyselleraccountAction(){
			$request= $this->getRequest();
			
			$uniqueIdForSeller = $request->getParam('sUqid');
			
			if(isset($uniqueIdForSeller)&&$uniqueIdForSeller!=''){
				if(DatabaseObject_SellerInformation::verifyPaypalEmailAccount($this->db, $uniqueIdForSeller)){
					//$this->messenger->addMessage('Congratulations! Seller account verified. You may now list items');
					//update the sellerInformation session if the user is logged in. 
					if($this->auth->hasIdentity()){
						if(isset($this->signedInUserSessionInfoHolder->sellerInfo)){
							$this->signedInUserSessionInfoHolder->sellerInfo->verified=1;
							$this->messenger->addMessage('Congratulations, your seller account has been verified. please log back in again to start your listing.');
							$this->_redirect('/account/logout');
						}
					}else{
						$this->messenger->addMessage('Congratulations, your seller account has been verified. please log back in again to start your listing.');
						$this->_redirect('/index/index');
					}
					
				}else{
					$this->messenger->addMessage('We are sorry, but your account has not been verified. Please check your email for the correct verification link. Thank you for your patience.');

				}
			}else{
				$this->messenger->addMessage('We are sorry, but you do not have the privalidge to view this page.');
			}
			$this->_redirect('/index');
		}
	}
?>