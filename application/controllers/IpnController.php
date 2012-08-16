<?php
	/*******************************************************************************
	**This class requires alot of work!!! with a real server
	*******************************************************************************/

	class IpnController extends CustomControllerAction
	{
		protected $shoppingCart; 
		
		public function indexAction()
		{
		
			$DB_Server = "localhost"; //your MySQL Server
			$DB_Username = "root"; //your MySQL User Name
			$DB_Password = "V1NCENTIOU$$"; //your MySQL Password
			$DB_DBName = "vedance";
		
			//create MySQL connection
			$Connect = @mysql_connect($DB_Server, $DB_Username, $DB_Password)
			or die("Couldn't connect to MySQL:
			" . mysql_error() . "
			" . mysql_errno());

			//select database
			$Db = @mysql_select_db($DB_DBName, $Connect)
			or die("Couldn't select database:
			" . mysql_error(). "
			" . mysql_errno());
		
		
			$createOrder=false;
			
			$req = 'cmd=_notify-validate';
			
			foreach ($_POST as $key => $value) {
			$value = urlencode(stripslashes($value));
			$req .= "&$key=$value";
			
			////echo "<br/>post was: ".$value;
			}
			
			$header ='';
			
			// post back to PayPal system to validate
			$header .= "POST https://www.paypal.com/cgi-bin/webscr HTTP/1.0\r\n";//getrid of sandbox for real. 			

/*$header .= "POST https://www.sandbox.paypal.com/cgi-bin/webscr HTTP/1.0\r\n";
*/			$header .= "Content-Type: application/x-www-form-urlencoded\r\n";
			$header .= "Content-Length: " . strlen($req) . "\r\n\r\n";
			
			$fp = fsockopen ('ssl://www.paypal.com', 443, $errno, $errstr, 30);  //get rid of sandbox for real.			
/*$fp = fsockopen ('ssl://www.sandbox.paypal.com', 443, $errno, $errstr, 30);  //get rid of sandbox for real.
*/
			/*$this->logger =Zend_Registry::get('orderLog');
			$this->logger->info("1====Here at IPN action'\r'");
			*/ 
			$this->debugLogger->info("1====fsockepen starting'\r'");
			if (!$fp) 
			{
			
				$this->debugLogger->info("2====fsockepen can not be done'\r'");
					
			} 
			else 
			{
				$this->debugLogger->info("3====fsockepen is open'\r'");

			
				fputs ($fp, $header . $req);
				while (!feof($fp)) 
				{
					$res = fgets ($fp, 1024);
					if (strcmp ($res, "VERIFIED") == 0) 
					{
					// check the payment_status is Compled
					
						if($_POST['invoice']=='')
						{
							$this->debugLogger->info('you are missing invoice!');
						}
						/*elseif($_POST['payment_status']!='Completed')
						{
							$this->logger->info('payment not complete');
						}*/
						else
						{
							
							$invoiceID =  trim($_POST['invoice']);
							
							$this->shoppingCart = new DatabaseObject_ShoppingCart($this->db);
							
														
							
							$this->debugLogger->info('invoice id is: '.$invoiceID);
							try
							{
							
								$this->shoppingCart->loadCartOnly($invoiceID);
								$this->debugLogger->info('createOrder is TURE');
								$createOrder=true;
							}
							catch(Exception $ex)
							{
								$this->debugLogger->info($ex->getMessage());
							}
							
							//$this->logger->info('shoppingCart->loadcart is not working');

								
						}
				
					// //echo the response
						//echo "The response from IPN was: <b>" .$res ."</b><br><br>";
						
						$this->debugLogger->info("8888 == The response from IPN was: ".$res);
						//loop through the $_POST array and print all vars to the screen.
						
						foreach($_POST as $key => $value){
						
								//echo $key." = ". $value."<br>";
								
								if($key =='payment_status')
								{
									$this->debugLogger->info($key);
									$this->debugLogger->info($value);
								}
								
								if($key =='invoice')
								{
								$this->debugLogger->info($key);
								$this->debugLogger->info($value);
								}
						}
				
					}
					else if (strcmp ($res, "INVALID") == 0) 
					{
						// log for manual investigation
					
						// //echo the response
						//echo "The response from IPN was: <b>" .$res ."</b>";
						//$this->logger->info("8888 == The response from IPN was: ".$res);
					}
				}
					
				$this->debugLogger->info("at after fclose fp");
				if($createOrder==true)
				{
						$this->debugLogger->warn("starting to do stuff");
						
						
						
						$products=$this->shoppingCart->loadCartProducts();
						
						//Zend_Debug::dump($shoppingCart);
						Zend_Debug::dump($products);
						
						$confirmedOrder = new DatabaseObject_Order($this->db);
						$confirmedOrder->order_unique_id = $this->shoppingCart->order_unique_id;
						$confirmedOrder->purchase_type = $this->shoppingCart->purchase_type;
						$confirmedOrder->buyer_email = $this->shoppingCart->buyer_email;
						$confirmedOrder->buyer_name = $this->shoppingCart->buyer_name;
						$confirmedOrder->buyer_phone_number = $this->shoppingCart->buyer_phone_number;
						$confirmedOrder->buyer_address = $this->shoppingCart->buyer_address;
						$confirmedOrder->buyer_city = $this->shoppingCart->buyer_city;
						$confirmedOrder->buyer_state = $this->shoppingCart->buyer_state;
						$confirmedOrder->buyer_zip = $this->shoppingCart->buyer_zip;
						$confirmedOrder->buyer_country = $this->shoppingCart->buyer_country;
						$confirmedOrder->total_number_items= $this->shoppingCart->total_number_items;
						$confirmedOrder->cart_costs = $this->shoppingCart->cart_costs;
						$confirmedOrder->final_total_costs =  $this->shoppingCart->final_total_costs;
						
						if($this->shoppingCart->purchase_type!=0){
						//individual purchase
						$confirmedOrder->partner_organization_name = $this->shoppingCart->partner_organization_name;
						$confirmedOrder->partner_organization_primary_contact = $this->shoppingCart->partner_organization_primary_contact;
						$confirmedOrder->partner_organization_email = $this->shoppingCart->partner_organization_email;
						$confirmedOrder->partner_organization_phone = $this->shoppingCart->partner_organization_phone;
						$confirmedOrder->partner_organization_address = $this->shoppingCart->partner_organization_address;
						$confirmedOrder->partner_organization_city = $this->shoppingCart->partner_organization_city;
						$confirmedOrder->partner_organization_state = $this->shoppingCart->partner_organization_state;
						$confirmedOrder->partner_organization_zip = $this->shoppingCart->partner_organization_zip;
						$confirmedOrder->partner_organization_country = $this->shoppingCart->partner_organization_country;
						$confirmedOrder->promotion_code_used = $this->shoppingCart->promotion_code_used;
						$confirmedOrder->promotion_amount_deducted = $this->shoppingCart->promotion_amount_deducted;
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
						$mail->addTo($confirmedOrder->partner_organization_email , trim('partner/reseller'));
						}
						
						//get the admin 'from details form teh config
						$mail->setFrom('VEdance administration', 'VEdance LLC');
			
						
						//set the subject and boy and send the mail
						$mail->setSubject('VEdance order confirmation');
						$mail->setBodyHtml(trim($body));
						$mail->send();
					
						//for back up reasons
						//$this->db->delete('shopping_cart_profile_simple', "order_unique_id = '".$invoiceID."'");
						//$this->db->delete('shopping_cart', "order_unique_id='".$invoiceID."'");
			
				}		
				else
				{

				$this->debugLogger->info("at createorder is false");		
				}
			}
			
			
			fclose ($fp);

			
		}
		
	}
?>