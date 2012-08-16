<?php
	/*******************************************************************************
	**This class requires alot of work!!! with a real server
	*******************************************************************************/

	class CheckoutController extends CustomControllerAction
	{
		protected $rewardPointsArray;
		public function preDispatch()
		{	
			parent::preDispatch();	
		
			
		}
		
		public function indexAction()
		{
			
			//storing shopping cart info!
			if(!$this->shoppingCartInfoSession->cartInfo || !$this->shoppingCartInfoSession->productInfo || !$this->shoppingCartInfoSession->shipping){	
				return $this->_redirect('shoppingcart/index'); 	
			}
		
			$shoppingCartDB = new DatabaseObject_ShoppingCart($this->db);
			//registering a new shopping cart info!
			$this->shoppingCartInfoSession->cartInfo->invoiceNumber=Text_Password::create(1, 'unpronounceable','alphabetical').Text_Password::create(8, 'unpronounceable','numeric');

			
			if(!$shoppingCartDB->loadCartOnly($this->shoppingCartInfoSession->cartInfo->invoiceNumber)){
				
				$shoppingCartDB->order_unique_id = $this->shoppingCartInfoSession->cartInfo->invoiceNumber;
			}
			
			$shoppingCartDB->purchase_type = $this->shoppingCartInfoSession->cartInfo->promotionTypeUsed;
			$shoppingCartDB->buyer_email = $this->shoppingCartInfoSession->shipping->buyer_email;
			$shoppingCartDB->buyer_phone_number = $this->shoppingCartInfoSession->shipping->buyer_phone_number;
			$shoppingCartDB->buyer_name = $this->shoppingCartInfoSession->shipping->buyer_name;
			$shoppingCartDB->buyer_address = $this->shoppingCartInfoSession->shipping->buyer_address;
			$shoppingCartDB->buyer_city = $this->shoppingCartInfoSession->shipping->buyer_city;
			$shoppingCartDB->buyer_state = $this->shoppingCartInfoSession->shipping->buyer_state;
			$shoppingCartDB->buyer_zip = $this->shoppingCartInfoSession->shipping->buyer_zip;
			$shoppingCartDB->buyer_country = $this->shoppingCartInfoSession->shipping->buyer_country;
			
			if($shoppingCartDB->purchase_type==1 || $shoppingCartDB->purchase_type==2){
			//individual purchase	
			$shoppingCartDB->partner_organization_name = $this->shoppingCartInfoSession->promotionPartnerInfo->name_of_organziation;
			$shoppingCartDB->partner_organization_primary_contact = $this->shoppingCartInfoSession->promotionPartnerInfo->primary_contact;
			$shoppingCartDB->partner_organization_email = $this->shoppingCartInfoSession->promotionPartnerInfo->email;
			$shoppingCartDB->partner_organization_phone = $this->shoppingCartInfoSession->promotionPartnerInfo->phone_number;
			$shoppingCartDB->partner_organization_address = $this->shoppingCartInfoSession->promotionPartnerInfo->address;
			$shoppingCartDB->partner_organization_city = $this->shoppingCartInfoSession->promotionPartnerInfo->city;
			$shoppingCartDB->partner_organization_state = $this->shoppingCartInfoSession->promotionPartnerInfo->state;
			$shoppingCartDB->partner_organization_zip = $this->shoppingCartInfoSession->promotionPartnerInfo->zip;
			$shoppingCartDB->partner_organization_country = $this->shoppingCartInfoSession->promotionPartnerInfo->country;
			
			$shoppingCartDB->promotion_code_used= $this->shoppingCartInfoSession->cartInfo->promotionCodeUsed;
			$shoppingCartDB->promotion_amount_deducted= $this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted;
	
			}
			$shoppingCartDB->total_number_items= $this->shoppingCartInfoSession->cartInfo->totalItems;
			$shoppingCartDB->cart_costs = $this->shoppingCartInfoSession->cartInfo->tempTotalCost;
			$shoppingCartDB->final_total_costs =  $this->shoppingCartInfoSession->cartInfo->totalCost;
		
			$shoppingCartDB->save();
		
		
			Zend_Debug::dump($this->shoppingCartInfoSession->cartInfo);
			Zend_Debug::dump($this->shoppingCartInfoSession->productInfo);
			Zend_Debug::dump($this->shoppingCartInfoSession->shipping);
			Zend_Debug::dump($this->shoppingCartInfoSession->promotionPartnerInfo);
		
		
		
		//*****************************GENERATING QUERY*******************************
			if($this->shoppingCartInfoSession->cartInfo->totalCost == 0  && $this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted==0){
					$this->shoppingCartInfoSession->cartInfo->totalCost=$this->shoppingCartInfoSession->cartInfo->tempTotalCost;
			}
			
			$query = 
	"https://www.paypal.com/cgi-bin/websrc?cmd=_cart&upload=1&business=vedance.info@gmail.com&invoice=".$this->shoppingCartInfoSession->cartInfo->invoiceNumber;
	
	/*$query = 
	"https://www.sandbox.paypal.com/cgi-bin/websrc?cmd=_cart&upload=1&business=vedance.info@gmail.com&invoice=".$this->shoppingCartInfoSession->cartInfo->invoiceNumber;
	*/
						//"&upload=1" must be put above if i decide to use shopping cart;
						
			if(count($this->shoppingCartInfoSession->productInfo)==1)
			{
				$this->shoppingCartInfoSession->productInfo[0]['final_product_name']=$this->shoppingCartInfoSession->productInfo[0]['product_name'].' '.$this->shoppingCartInfoSession->productInfo[0]['attributes']['Measurement_size'];
				$query .= "&item_name_1=".$this->shoppingCartInfoSession->productInfo[0]['product_name'].' '.$this->shoppingCartInfoSession->productInfo[0]['attributes']['Measurement_size'];
	
	
				$query .="&amount_1=0";//.$this->shoppingCartItem[0]['unit_cost'];
				$query .="&quantity_1=1";
			}
			elseif(count($this->shoppingCartInfoSession->productInfo)>1)
			{

				foreach($this->shoppingCartInfoSession->productInfo as $k =>$v)
				{
				$this->shoppingCartInfoSession->productInfo[$k]['final_product_name']=$this->shoppingCartInfoSession->productInfo[$k]['product_name'].' '.$this->shoppingCartInfoSession->productInfo[$k]['attributes']['Measurement_size'];
				$query .="&item_name_".($k+1)."=".$this->shoppingCartInfoSession->productInfo[$k]['product_name'].' '.$this->shoppingCartInfoSession->productInfo[$k]['attributes']['Measurement_size'];
				$query .="&amount_".($k+1)."=0";//.$this->shoppingCartItem[$k]['unit_cost'];
				$query .="&quantity_".($k+1)."=1";
				}
			}
			if($this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted!=0){
				$query .="&item_name_".($this->shoppingCartInfoSession->cartInfo->totalItems+1)."= Promotion code used-".$this->shoppingCartInfoSession->cartInfo->promotionCodeUsed." amount deducted-". $this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted;
				$query .="&amount_".($this->shoppingCartInfoSession->cartInfo->totalItems+1)."=0";//.$this->shoppingCartItem[$k]['unit_cost'];
				$query .="&quantity_".($this->shoppingCartInfoSession->cartInfo->totalItems+1)."=1";
				
				$query.="&item_name_".($this->shoppingCartInfoSession->cartInfo->totalItems+2)."=Total Amount";
				$query.="&amount_".($this->shoppingCartInfoSession->cartInfo->totalItems+2)."=".$this->shoppingCartInfoSession->cartInfo->totalCost;
				$query.="&quantity_".($this->shoppingCartInfoSession->cartInfo->totalItems+2)."=1";
			}else{
			
			$query.="&item_name_".($this->shoppingCartInfoSession->cartInfo->totalItems+1)."=Total Amount";
			$query.="&amount_".($this->shoppingCartInfoSession->cartInfo->totalItems+1)."=".$this->shoppingCartInfoSession->cartInfo->totalCost;
			$query.="&quantity_".($this->shoppingCartInfoSession->cartInfo->totalItems+1)."=1";
			}
			//$query.="&shipping = 8";

			$query .= "&return=http://www.vedance.com/shoppingcart/index"."&cancel_return=http://www.vedance.com/shoppingcart/index".
"&notify_url=http://www.vedance.com/ipn"; 

			
		//echo $query;
		
			DatabaseObject_Helper_ShoppingcartManager::emptyCartProfileSimpleBeforeReenterCheckoutInsertion($this->db, $shoppingCartDB->order_unique_id);

			
			if(count($this->shoppingCartInfoSession->productInfo)==1){
				$product = new DatabaseObject_ShoppingCartProfileSimple($this->db);
				$product->order_unique_id = $shoppingCartDB->order_unique_id;
				$product->product_id = $this->shoppingCartInfoSession->productInfo[0]['product_id'];
				$product->product_type = $this->shoppingCartInfoSession->productInfo[0]['product_type'];
				$product->product_name = $this->shoppingCartInfoSession->productInfo[0]['final_product_name'];
				$product->product_tag = $this->shoppingCartInfoSession->productInfo[0]['product_tag'];
				$product->inventory_attribute_table = $this->shoppingCartInfoSession->productInfo[0]['inventory_attribute_table'];
				$product->product_price = $this->shoppingCartInfoSession->productInfo[0]['product_price'];
				//Zend_Debug::dump($product);
				$product->save();
				
			}elseif(count($this->shoppingCartInfoSession->productInfo)>1){
				foreach($this->shoppingCartInfoSession->productInfo as $k => $v){
					$product = new DatabaseObject_ShoppingCartProfileSimple($this->db);
					$product->order_unique_id = $shoppingCartDB->order_unique_id;
					$product->product_id = $v['product_id'];
					$product->product_type = $v['product_type'];
					$product->product_name = $v['final_product_name'];
					$product->product_tag = $v['product_tag'];
					$product->inventory_attribute_table = $v['inventory_attribute_table'];
					$product->product_price = $v['product_price'];
					$product->save();
				}
			}
		
			Zend_Debug::dump($this->shoppingCartInfoSession->productInfo);

		
			$this->_redirect($query);
			
		}

		//not really used. 
		public function rewardsandpromotionsAction(){
			$request = $this->getRequest();
			$rewardpoints = $request->getParam('rewardPoints');
			$promotionCode = $request->getParam('promotionCode');
			if(in_array($rewardpoints, $this->rewardPointsArray) || $rewardpoints=='0'){
				//echo 'yes reward points correct!'; 
				$this->shoppingCartInfoSession->cartInfo->rewardPointsUsed=$rewardpoints;
				$this->shoppingCartInfoSession->cartInfo->rewardAmountDeducted = $this->shoppingCartInfoSession->cartInfo->rewardPointsUsed/4;
				//echo "reward Amound deducted: ".$this->shoppingCartInfoSession->cartInfo->rewardAmountDeducted;
				$this->shoppingCartInfoSession->cartInfo->promotionCodeUsed = $promotionCode;
				$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted = 0;
				$this->shoppingCartInfoSession->cartInfo->finalTotalCost=$this->shoppingCartInfoSession->cartInfo->tempTotalCost-$this->shoppingCartInfoSession->cartInfo->rewardAmountDeducted-$this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted;
				$this->shoppingCartInfoSession->cartInfo->buyerId = $this->signedInUserSessionInfoHolder->generalInfo->userID;
				$this->shoppingCartInfoSession->cartInfo->buyerUsername = $this->signedInUserSessionInfoHolder->generalInfo->username;
				$this->shoppingCartInfoSession->cartInfo->buyerEmail = $this->signedInUserSessionInfoHolder->generalInfo->email;
				$this->shoppingCartInfoSession->cartInfo->buyerName = $this->signedInUserSessionInfoHolder->generalInfo->first_name.' '.$this->signedInUserSessionInfoHolder->generalInfo->last_name;
				$this->shoppingCartInfoSession->cartInfo->checkoutOk=true;
				//Zend_Debug::dump($this->shoppingCartInfoSession->cartInfo);
				//Zend_Debug::dump($this->shoppingCartInfoSession->productInfo);
				$json = array('successful'=>true, 'rewardPoints'=>$rewardpoints, 'promotionCode'=>$promotionCode);
				$this->sendJson($json);
			}else{
				
				$json = array('successful'=>false, 'rewardPoints'=>$rewardpoints, 'promotionCode'=>$promotionCode);
				$this->sendJson($json);
			}
			
			//work on promotion code later after the shopping cart is done. 
			//start this when I start to make the promotions for the website. 
		}
		
		public function confirmationAction()
		{	
			if($this->shoppingCartInfoSession->cartInfo->checkoutOk==false){
				$this->messenger->addMessage('We are sorry, but you have incomplete information during checkout.');
				$this->_redirect('/shoppingcart/index');	
			}
			if(!isset($this->shoppingCartInfoSession->cartInfo->finalTotalCost)){
				$this->messenger->addMessage('We are sorry, please enter your reward points and promotions if you have any.');
				$this->_redirect('/shoppingcart/index');	
			}
			$this->view->user=$this->signedInUserSessionInfoHolder;
			$this->view->userRewardPoint=$this->userObject->reward_point;
			if(isset($this->signedInUserSessionInfoHolder->generalInfo->defaultShippingAddress->address_id)){
				$this->view->defaultShippingKey = $this->signedInUserSessionInfoHolder->generalInfo->defaultShippingAddress->address_id;
				$this->shoppingCartInfoSession->cartInfo->totalShippingCosts=0;
				$this->shoppingCartInfoSession->cartInfo->tempTotalCost=0;
				$this->shoppingCartInfoSession->cartInfo->totalCost=0;
				$this->shoppingCartInfoSession->cartInfo->rewardPointsAwarded=0;
				foreach($this->shoppingCartInfoSession->productInfo as $k=>$v){
					if(strtolower($this->signedInUserSessionInfoHolder->generalInfo->shippingAddress[$this->signedInUserSessionInfoHolder->generalInfo->defaultShippingAddress->address_id]->country)==strtolower($v['product_country_origin'])){
						echo 'here at domestic shipping';
						$this->shoppingCartInfoSession->productInfo[$k]['current_shipping_rate']=$v['domestic_shipping_rate'];
						$this->shoppingCartInfoSession->cartInfo->totalShippingCosts+=$this->shoppingCartInfoSession->productInfo[$k]['current_shipping_rate'];
						$this->shoppingCartInfoSession->cartInfo->rewardPointsAwarded+=$v['reward_points_awarded'];
						
						//$this->shoppingCartInfoSession->cartInfo->afterShippingTempTotalCost +=$this->shoppingCartInfoSession->cartInfo->totalShippingCosts;
					}else{
						echo 'here at international shipping';
						$this->shoppingCartInfoSession->productInfo[$k]['current_shipping_rate']=$v['international_shipping_rate'];
						$this->shoppingCartInfoSession->cartInfo->totalShippingCosts+=$this->shoppingCartInfoSession->productInfo[$k]['current_shipping_rate'];
						$this->shoppingCartInfoSession->cartInfo->rewardPointsAwarded+=$v['reward_points_awarded'];
						
						//$this->shoppingCartInfoSession->cartInfo->afterShippingTempTotalCost +=$this->shoppingCartInfoSession->cartInfo->totalShippingCosts;
					}
					$this->shoppingCartInfoSession->cartInfo->tempTotalCost +=$v['product_price'];
				}
				$this->shoppingCartInfoSession->cartInfo->currentDeliveryId = $this->signedInUserSessionInfoHolder->generalInfo->defaultShippingAddress->address_id;
					
				$this->shoppingCartInfoSession->cartInfo->totalCost = $this->shoppingCartInfoSession->cartInfo->tempTotalCost+$this->shoppingCartInfoSession->cartInfo->totalShippingCosts - $this->shoppingCartInfoSession->cartInfo->rewardAmountDeducted;
			}
			else{
				$this->messenger->addMessage('We are sorry, but you must indicate a shipping address.');
				$this->_redirect('/shoppingcart/index');	
				//echo "there is no default shipping key set in session variable";
			}
			//$viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
			//$view= $viewRenderer->view;
			//echo 'here'.Zend_Debug::dump($view);
			$this->view->shoppingCartProducts = $this->shoppingCartInfoSession->productInfo;
			$this->view->shoppingCartInfo = $this->shoppingCartInfoSession->cartInfo;
			Zend_Debug::dump($this->shoppingCartInfoSession->cartInfo);
			Zend_Debug::dump($this->shoppingCartInfoSession->productInfo);
		}
		
		public function testAction()
		{
			
		
		
		}
	
		/*this puts the cart session into the shopping cart database. 
		**then it proceeds to paypal. 
		**/
		public function createorderAction()
		{	
		
		
			if(!isset($this->shoppingCartInfoSession->cartInfo->checkoutOk)|| $this->shoppingCartInfoSession->cartInfo->checkoutOk!=true){
				$this->messenger->addMessage('You currently have an error in your shopping cart, please empty your cart and try again. We are sorry for the inconvience.');
				//$this->_redirect('/shoppingcart/index');
			}else{
				//proceed to creating the shoppingcart item. 
								
				$shoppingCart = new DatabaseObject_ShoppingCart($this->db);
				
				$shoppingCart->order_shipping_id =$orderShippingAddress->getId();
				$shoppingCart->buyer_username = $this->shoppingCartInfoSession->cartInfo->buyerUsername;
				$shoppingCart->buyer_id = $this->shoppingCartInfoSession->cartInfo->buyerId;
				$shoppingCart->buyer_email = $this->shoppingCartInfoSession->cartInfo->buyerEmail;
				$shoppingCart->buyer_name = $this->shoppingCartInfoSession->cartInfo->buyerName;
				$shoppingCart->total_number_items = $this->shoppingCartInfoSession->cartInfo->totalItems;
				$shoppingCart->cart_costs = $this->shoppingCartInfoSession->cartInfo->tempTotalCost;
				$shoppingCart->total_costs = $this->shoppingCartInfoSession->cartInfo->totalCost;
				$shoppingCart->total_shipping_costs=$this->shoppingCartInfoSession->cartInfo->totalShippingCosts;
				$shoppingCart->reward_points_awarded = $this->shoppingCartInfoSession->cartInfo->rewardPointsAwarded;
				$shoppingCart->final_total_costs = $this->shoppingCartInfoSession->cartInfo->finalTotalCost;
				$shoppingCart->reward_points_used = $this->shoppingCartInfoSession->cartInfo->rewardPointsUsed;
				$shoppingCart->reward_amount_deducted = $this->shoppingCartInfoSession->cartInfo->rewardAmountDeducted;
				$shoppingCart->promotion_code_used = $this->shoppingCartInfoSession->cartInfo->promotionCodeUsed;
				$shoppingCart->promotion_amount_deducted = $this->shoppingCartInfoSession->cartInfo->promotionAmountDeducted;
				$shoppingCart->save();
				
				$tempShipping='';
				foreach($this->shoppingCartInfoSession->productInfo as $k=>$v){
					$productProfile=new DatabaseObject_ShoppingCartProfile($this->db);
					foreach($v as $key=>$value){
						
						if($key!=='attributes'){
							$productProfile->$key = $value;
								//echo " key is: ".$key.' ';
								//echo " value is: ".$value.'<br />';	
						}
						if($key=='current_shipping_rate'){
							$tempShipping=$value;
						}
						echo "key is: ".$key.' ';
						echo "value is: ".$value.'<br />';
						if($key=='attributes'){
							foreach($value as $attributeKey =>$attributeValue){
								$productProfile->profile->$attributeKey = $attributeValue;
								echo "attribute key is: ".$attributeKey.' ';
								echo "attribute value is: ".$attributeValue.'<br />';
							}
						}
					}
					$productProfile->seller_receivable = $productProfile->product_price*0.85+$tempShipping;
					$productProfile->order_unique_id = $shoppingCart->order_unique_id;
					$productProfile->order_shipping_id = $shoppingCart->order_shipping_id;
					$productProfile->buyer_name = $shoppingCart->buyer_name;
					$productProfile->buyer_id = $shoppingCart->buyer_id;
					$productProfile->buyer_username = $shoppingCart->buyer_username;
					$productProfile->buyer_email = $shoppingCart->buyer_email;
					$productProfile->buyer_country = $this->signedInUserSessionInfoHolder->generalInfo->affiliation;
					//$productProfile->order_shipping_id=$shoppingCart->order_shipping_id
					$productProfile->cart_id = $shoppingCart->getId();
					$productProfile->save();
				}
				
				$this->view->orderUniqueId = $shoppingCart->order_unique_id;
				//unset($this->shoppingCartInfoSession->productInfo);
				//unset($this->shoppingCartInfoSession->cartInfo);
				//after this creates the order, transfer to paypal. erase cart session. 
			}
		}
		
		
		//this is the order transfer process after paypal transaction is complete. 
		public function orderconfirmedAction(){
			$request = $this->getRequest();
			$orderId = $request->getParam('orderId');
			$shoppingCart = new DatabaseObject_ShoppingCart($this->db);
			$shoppingCart->loadCartOnly($orderId);
			$products=$shoppingCart->loadCartProducts();
			
			//Zend_Debug::dump($shoppingCart);
			Zend_Debug::dump($products);
			
			$confirmedOrder = new DatabaseObject_Order($this->db);
			$confirmedOrder->order_unique_id = $shoppingCart->order_unique_id;
			$confirmedOrder->purchase_type = $shoppingCart->purchase_type;
			$confirmedOrder->buyer_email = $shoppingCart->buyer_email;
			$confirmedOrder->buyer_name = $shoppingCart->buyer_name;
			$confirmedOrder->buyer_phone_number = $shoppingCart->buyer_phone_number;
			$confirmedOrder->buyer_address = $shoppingCart->buyer_address;
			$confirmedOrder->buyer_city = $shoppingCart->buyer_city;
			$confirmedOrder->buyer_state = $shoppingCart->buyer_state;
			$confirmedOrder->buyer_zip = $shoppingCart->buyer_zip;
			$confirmedOrder->buyer_country = $shoppingCart->buyer_country;
			$confirmedOrder->total_number_items= $shoppingCart->total_number_items;
			$confirmedOrder->cart_costs = $shoppingCart->cart_costs;
			$confirmedOrder->final_total_costs =  $shoppingCart->final_total_costs;
			
			if($shoppingCart->purchase_type!=0){
			//individual purchase
			$confirmedOrder->partner_organization_name = $shoppingCart->partner_organization_name;
			$confirmedOrder->partner_organization_primary_contact = $shoppingCart->partner_organization_primary_contact;
			$confirmedOrder->partner_organization_email = $shoppingCart->partner_organization_email;
			$confirmedOrder->partner_organization_phone = $shoppingCart->partner_organization_phone;
			$confirmedOrder->partner_organization_address = $shoppingCart->partner_organization_address;
			$confirmedOrder->partner_organization_city = $shoppingCart->partner_organization_city;
			$confirmedOrder->partner_organization_state = $shoppingCart->partner_organization_state;
			$confirmedOrder->partner_organization_zip = $shoppingCart->partner_organization_zip;
			$confirmedOrder->partner_organization_country = $shoppingCart->partner_organization_country;
			$confirmedOrder->promotion_code_used = $shoppingCart->promotion_code_used;
			$confirmedOrder->promotion_amount_deducted = $shoppingCart->promotion_amount_deducted;
			}
			
			
		
		
			$confirmedOrder->save();
			
			
			foreach($products as $k=>$v){
				Zend_Debug::dump($v);	
				$orderProduct = new DatabaseObject_OrderProfileSimple($this->db);
				//echo  $v['order_unique_id'];
				$orderProduct->order_unique_id= $v['order_unique_id'];
				$orderProduct->product_id= $v['product_id'];
				$orderProduct->product_type= $v['product_type'];
				$orderProduct->product_name= $v['product_name'];
				$orderProduct->product_tag= $v['product_tag'];
				$orderProduct->inventory_attribute_table= $v['inventory_attribute_table'];
				$orderProduct->product_price= $v['product_price'];
				$orderProduct->save();
			}
			
			//*******************************SENDING MAIL*****************/
			$templater = new Templater();			
							
			$templater->order=$confirmedOrder;
			$templater->products = $products;
			//fetch teh e-amil body
			$body = $templater->render('email/individual-order-notice.tpl');
			
			if($confirmedOrder->purchase_type!=0){
			$body = $templater->render('email/individual-partner-order-notice.tpl');
			}
			
			//extract the subject from the first line
			list($subject, $body) = preg_split('/\r|\n/', $body, 2);
			
			//now set up and send teh email
			$mail = new Zend_Mail();
			
			//set the to address and the user's full name in the 'to' line
			//echo "<br/> here at user email address: ".$this->email."<br/>";
			$mail->addTo('VEdance.info@gmail.com', trim('VEdance'));
			$mail->addTo($confirmedOrder->buyer_email , trim('buyer'));
			if($confirmedOrder->purchase_type!=0){
			$mail->addTo($confirmedOrder->partner_organization_email , trim('buyer'));
			}
			
			//get the admin 'from details form teh config
			$mail->setFrom('VEdance administration', 'VEdance LLC');
			
			//set the subject and boy and send the mail
			$mail->setSubject('VEdance order confirmation');
			$mail->setBodyHtml(trim($body));
			$mail->send();
			
			$this->db->delete('shopping_cart_profile_simple', "order_unique_id = '".$shoppingCart->order_unique_id."'");
			$this->db->delete('shopping_cart', "order_unique_id='".$shoppingCart->order_unique_id."'");
			
			
			//****************ENDING SENDING MAIL*************/
			
			/*
			
			foreach($shoppingCart->products as $k =>$v){
				$orderProfile = new DatabaseObject_OrderProfile($this->db);
				foreach($v as $key=>$value){
					if($key!='profile' && $key!='ts_created'){
					echo 'key is: '.$key.' value is:'.$value.'<br />';
					$orderProfile->$key = $value;
					}elseif($key=='profile'){
						foreach($value as $attributeKey =>$attributeValue){
							//$productProfile->profile->$attributeKey = $attributeValue;
							$orderProfile->profile->$attributeValue['profile_key'] = $attributeValue['profile_value'];
							echo "attribute key is: ".$attributeValue['profile_key'].' ';
							echo "attribute value is: ".$attributeValue['profile_value'].'<br />';
						}
					}
				}	
				$orderProfile->order_id = $confirmedOrder->getId();
				$orderProfile->save();
				$orderProfileStatusAndDelivery = new DatabaseObject_OrderProfileStatusAndDelivery($this->db);
				$orderProfileStatusAndDelivery->order_profile_id=$orderProfile->getId();
				$orderProfileStatusAndDelivery->save();
			}*/
			
			
			
			//now at deleting the shopping cart after completion. 
			/*foreach($shoppingCart->products as $k =>$v){
				$shoppingCartProfile = new DatabaseObject_ShoppingCartProfile($this->db);
				$shoppingCartProfile->load($k);
				$shoppingCartProfile->delete();
			}*/
			
			
			//$shoppingCart->delete();
		}
	}
?>