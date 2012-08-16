<?php

		/*add of products needs to be checked against an all attribute array so that no other attributes can be added at randome*/

		class ShoppingcartController extends CustomControllerAction
		{
			
			public function init(){
				parent::init();
	
				$this->breadcrumbs->addStep('Shopping cart', $this->getUrl(null, 'index'));
			}
			
			public function preDispatch(){
				parent::preDispatch();	
				if($this->auth->hasIdentity()){
					if(!isset($this->signedInUserSessionInfoHolder->generalInfo->shippingAddress)){
						$this->userObject->createShippingAddressInfoSessionObject($this->signedInUserSessionInfoHolder->generalInfo->shippingAddress);
					}
					$this->view->signedInUser=$this->signedInUserSessionInfoHolder;
				} 
				
				$this->view->shoppingCartProducts = $this->shoppingCartInfoSession->productInfo;
				$this->view->shoppingCartInfo = $this->shoppingCartInfoSession->cartInfo;
			
			}
			
			public function indexAction(){
				
			
				
				$this->request = $this->getRequest();
				
				$fp = new FormProcessor_ShippingAddress($this->db, $this->shoppingCartInfoSession->shipping);
				
				if($this->request->isPost()){
					$validate =$this->request->isXmlHttpRequest();//check to see if it is ajax request

					if($validate){
						//echo 'here';
						$fp->validateOnly(true); 
						$fp->process($this->request);//this just process the form for ajax request. 
												//when ajax request is finished, the form submits and the following code takes care of it. 
					}elseif($fp->process($this->request)){
						echo 'here at good process with available checkouts!';
						
						//REINDEX SHOPPING CART
						
						$tempCartInfo = array();
						foreach($this->shoppingCartInfoSession->productInfo as $k=>$v){
							$tempCartInfo[]=$v;
						}
						$this->shoppingCartInfoSession->productInfo=$tempCartInfo;
						$this->_redirect('checkout/index'); 
					}else{
						//display error.	
					}
					
					if($validate){
					$json = array('errors'=> $fp->getErrors());	
					$this->sendJson($json); 
					}
				}
				
				
				$this->view->fp=$fp;

				
				
				
				if($this->getRequest()->isXmlHttpRequest()){
					$this->view->layout = 'shoppingcartAJAX';
				}else{
					$this->view->layout= 'shoppingcart';
				}
				//Zend_Debug::dump($this->shoppingCartInfoSession->shipping);
			}
			
			
			public function additemtoshoppingcartAction(){
				$request = $this->getRequest();
				
				$id=$this->getRequest()->getParam('id');
				$purchase_type=$this->getRequest()->getParam('product');
				$currentItem=array();
				$product=array();
				
				$this->shoppingCartInfoSession->cartInfo->totalCost=0;
				//$this->shoppingCartInfoSession->cartInfo->promotionCodeUsed='';
				$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted=0;
				
				if($purchase_type=='Inventory'){
						$product = DatabaseObject_Helper_ProductDisplay::retrieveProductFromInventoryForPurchaseDetails($this->db, $id);
					
						//echo 'product count is: '.count($product);
						Zend_Debug::dump($product);
					if(count($product)>0){
						echo 'here';
						$currentItem=DatabaseObject_Helper_ShoppingcartManager::setInventoryProductInfoForCart($product);
						$currentItem['product_type_added_to_shopping_cart']='Inventory';
						
						$this->shoppingCartInfoSession->productInfo[]=$currentItem;
						$this->shoppingCartInfoSession->cartInfo->tempTotalCost += $this->shoppingCartInfoSession->cartInfo->totalCost + $currentItem['product_price'];
						$this->shoppingCartInfoSession->cartInfo->totalRewardPoints = $this->shoppingCartInfoSession->cartInfo->totalRewardPoints + $currentItem['reward_points_awarded'];
						Zend_Debug::dump($currentItem);
						$this->shoppingCartInfoSession->cartInfo->totalItems = $this->shoppingCartInfoSession->cartInfo->totalItems+1;
			
					}
					
				}elseif($purchase_type=='Customize'){
					$product = DatabaseObject_Helper_ProductDisplay::retrieveProductFromProductsForPurchaseDetails($this->db, $id);
					if(count($product)>0){
						$currentItem=DatabaseObject_Helper_ShoppingcartManager::setCustomizeBasicProductInfoForCart($product);
						$currentItem['product_type_added_to_shopping_cart']='Customize';
						
						foreach($this->getRequest()->getParam('attribute') as $k=>$v){
							$currentItem['attributes'][$k]=$v;
						}
						$this->shoppingCartInfoSession->productInfo[]=$currentItem;
						$this->shoppingCartInfoSession->cartInfo->tempTotalCost += $this->shoppingCartInfoSession->cartInfo->totalCost + $currentItem['product_price'];
						$this->shoppingCartInfoSession->cartInfo->totalRewardPoints = $this->shoppingCartInfoSession->cartInfo->totalRewardPoints + $currentItem['reward_points_awarded'];
				
						$this->shoppingCartInfoSession->cartInfo->totalItems = $this->shoppingCartInfoSession->cartInfo->totalItems+1;
					}
					
				}
				
				if($this->shoppingCartInfoSession->cartInfo->promotionCodeUsed!=''){
					$amount = round($this->shoppingCartInfoSession->cartInfo->tempTotalCost*$this->shoppingCartInfoSession->cartInfo->promotionCodePercentage/100,2);
					$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted = $amount;
					$this->shoppingCartInfoSession->cartInfo->totalCost=$this->shoppingCartInfoSession->cartInfo->tempTotalCost-$amount;
				}else{
					$this->shoppingCartInfoSession->cartInfo->totalCost = $this->shoppingCartInfoSession->cartInfo->tempTotalCost;
				}
					//$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted=0;
				//Zend_Debug::dump($currentItem);
					
				
				$this->messenger->addMessage('Product added to shopping cart.');
				$this->_redirect('shoppingcart/index');	
				//$this->sendJSON($currentItem);
			}
			
			public function removeitemsfromshoppingcartAction(){
				$request = $this->getRequest();
				$cartId = $request->getParam('cartProductId');
				
				$this->shoppingCartInfoSession->cartInfo->totalCost=0;
				//$this->shoppingCartInfoSession->cartInfo->promotionCodeUsed='';
				$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted=0;
				//echo $cartId;
				//Zend_Debug::dump($this->shoppingCartInfoSession->productInfo[8]['product_price']);
				echo 'product price is: '.$this->shoppingCartInfoSession->productInfo[$cartId]['product_price'];
				$this->shoppingCartInfoSession->cartInfo->tempTotalCost -= $this->shoppingCartInfoSession->productInfo[$cartId]['product_price'];
				$this->shoppingCartInfoSession->cartInfo->totalRewardPoints = $this->shoppingCartInfoSession->cartInfo->totalRewardPoints - $this->shoppingCartInfoSession->productInfo[$cartId]['reward_points_awarded'];
				$this->shoppingCartInfoSession->cartInfo->totalItems = $this->shoppingCartInfoSession->cartInfo->totalItems-1;
				unset($this->shoppingCartInfoSession->productInfo[$cartId]);
				if($this->shoppingCartInfoSession->cartInfo->promotionCodeUsed!=''){
					$amount = round($this->shoppingCartInfoSession->cartInfo->tempTotalCost*$this->shoppingCartInfoSession->cartInfo->promotionCodePercentage/100,2);
					$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted = $amount;
					$this->shoppingCartInfoSession->cartInfo->totalCost=$this->shoppingCartInfoSession->cartInfo->tempTotalCost-$amount;
					
				}
				if($this->shoppingCartInfoSession->cartInfo->totalItems==0){
				unset($this->shoppingCartInfoSession->productInfo);
				unset($this->shoppingCartInfoSession->cartInfo);
				}
				
				
				
				$this->messenger->addMessage('Product removed from shopping cart.');
				$this->_redirect('shoppingcart/index'); 
			}
			
			public function resetshoppingcartAction(){
				
				unset($this->shoppingCartInfoSession->productInfo);
				unset($this->shoppingCartInfoSession->cartInfo);
				$this->messenger->addMessage('Your shopping cart had been emptied.');
				$this->_redirect('shoppingcart/index'); 
			}
			
			public function applypromotionAction(){
				$promotion = $this->getRequest()->getParam('code');
				
				$event = new DatabaseObject_Event($this->db);
				$this->shoppingCartInfoSession->cartInfo->totalCost=0;
				if($event->loadByPromotionCode($promotion))
				{					
					
					$dollar = $event->profile->price;
					$percentage = $event->profile->percentage;
					
					$this->shoppingCartInfoSession->cartInfo->promotionCodeUsed = $promotion;
					if($dollar !="0")
					{
					
						$this->shoppingCartInfoSession->cartInfo->promotionCodeFixedAmount =$dollar;

						$amount = $dollar;
						$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted = $amount;
						$this->shoppingCartInfoSession->cartInfo->totalCost=$this->shoppingCartInfoSession->cartInfo->tempTotalCost-$amount;
					}
					elseif($percentage !="0") 
					{
						$this->shoppingCartInfoSession->cartInfo->promotionCodePercentage =$percentage;

						
						$amount = round($this->shoppingCartInfoSession->cartInfo->tempTotalCost*$percentage/100,2);
						$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted = $amount;
						$this->shoppingCartInfoSession->cartInfo->totalCost=$this->shoppingCartInfoSession->cartInfo->tempTotalCost-$amount;
						
						
					}
					
					
					$userPromotionBelongTo = DatabaseObject_Helper_UserManager::loadUserPromotionCode($this->db, $event->getId());
					
					
					
					if ($this->getRequest()->isXmlHttpRequest()){
					
						if(count($userPromotionBelongTo)==0){
						
							$json = array('errors'=>'none', 'promotion'=>$promotion, 'tempTotalCost'=>$this->shoppingCartInfoSession->cartInfo->tempTotalCost, 'totalCost'=>$this->shoppingCartInfoSession->cartInfo->totalCost, 'amount_deducted'=>$amount, 'promotionPreviledge'=>'');
							
							$this->shoppingCartInfoSession->cartInfo->promotionTypeUsed=0;

							
							$this->sendJson($json);
						}else{
							$promotionQuote='This promotion is tied to our sponsored/partnered/reseller organization '.$userPromotionBelongTo[0]['name_of_organization'].' and this order will be shipped to the account address<br/>'.$userPromotionBelongTo[0]['name_of_organization'].' <br/>'.$userPromotionBelongTo[0]['address_one'].'<br/> '.$userPromotionBelongTo[0]['city'].' '.$userPromotionBelongTo[0]['state'].', '.$userPromotionBelongTo[0]['zip'].'<br/><br/>If you are a part of this organization, it is your responsibility to contact and retrieve this order from '.$userPromotionBelongTo[0]['name_of_organization'].'<br/><br/>If you are not apart of this organziation and do not have the consent from this organization to use this promotion code, please do not use this promotion code. ';
							
							$json=array('errors'=>'none', 'promotion'=>$promotion, 'tempTotalCost'=>$this->shoppingCartInfoSession->cartInfo->tempTotalCost, 'totalCost'=>$this->shoppingCartInfoSession->cartInfo->totalCost, 'amount_deducted'=>$amount, 'promotion_previledge'=>$promotionQuote);
							
							$this->shoppingCartInfoSession->cartInfo->promotionQuote=$promotionQuote;
							$this->shoppingCartInfoSession->cartInfo->promotionTypeUsed =$userPromotionBelongTo[0]['promotion_type'];
							
							$this->shoppingCartInfoSession->promotionPartnerInfo->name_of_organziation = $userPromotionBelongTo[0]['name_of_organization'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->primary_contact = $userPromotionBelongTo[0]['primary_contact'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->email = $userPromotionBelongTo[0]['email'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->phone_number = $userPromotionBelongTo[0]['phone_number'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->address = $userPromotionBelongTo[0]['address_one'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->city = $userPromotionBelongTo[0]['city'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->state = $userPromotionBelongTo[0]['state'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->zip = $userPromotionBelongTo[0]['zip'];
							$this->shoppingCartInfoSession->promotionPartnerInfo->country = $userPromotionBelongTo[0]['country'];
							$this->sendJson($json);

						}
					}else{
					$this->_redirect('shoppingcart/index'); 
					}
					
				}else{
					
					if ($this->getRequest()->isXmlHttpRequest()){
						
					$json = array('errors'=>"We are sorry, but you have entered an invalid promotion code.");
					$this->sendJson($json);
					}else{
					$this->_redirect('shoppingcart/index'); 
					}
				}
			}
		}
?>