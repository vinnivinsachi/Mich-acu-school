<?php


	
	class IndexController extends CustomControllerAction
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
			$request= $this->getRequest();
			$category = $request->getParam('category');
			$tag = $request->getParam('tag');
			
			if(strlen($category)==0 || !isset($category)){
				$category='Home';
			}
			
			
			if($category =='Memberships'){
				$options = array('order_by'=>'DESC');
				$availableTags = DatabaseObject_Helper_BlogManager::retrieveTagsForCategory($this->db, $category, $_SESSION['language'], $options);
			}else{
				$availableTags = DatabaseObject_Helper_BlogManager::retrieveTagsForCategory($this->db, $category, $_SESSION['language']);
			}
			
			//Zend_Debug::dump($availableTags);
			
			$posts = DatabaseObject_Helper_BlogManager::retrievePostForCategory($this->db, $category,  $_SESSION['language']);
			
			
			
			$this->view->availableTags = $availableTags;
			$this->view->posts = $posts;
			$this->view->category = $category;
			if($category =='Memberships'){
				$this->render('memberships');
			}
		}
		
		public function memberpostAction(){
			$request= $this->getRequest();
			$postID = $request->getParam('id');
			if(strlen($postID)==0 || !isset($postID)){
				echo 'error. no post specified';
			}
			
			$blog = new DatabaseObject_BlogPost($this->db);
			$blog->load($postID);
			//Zend_Debug::dump($blog);
			
			$this->view->blog = $blog;
			//$this->view->layout = 'applicationAJAX';
		}
		
		public function classicAction(){
		}
		
		public function needforpantsAction(){
		}
		
		public function executiveAction(){
		}
		
		public function stoneAction(){
		}
		
		public function siennaAction(){
		}
		
		public function royaleAction(){	
		}
		
		public function aboutusAction(){
		}
		
		public function contactusAction()
		{
			
			$request=$this->getRequest(); //zend function returns all get and post items. 
			
			$fp = new FormProcessor_ContactUs($this->db);
			
			if($request->isPost()) //zend function
			{
				if($fp->process($request))	//custom defined function in UserRegistration.php
				{
					$templater = new Templater();			
					
					$message = new DatabaseObject_ContactUs($this->db);
					$message->loadByID($fp->post->getId());

					$templater->online_message=$message;

					
					//fetch teh e-amil body
					$body = $templater->render('email/contact-us.tpl');
					
					//extract the subject from the first line
					list($subject, $body) = preg_split('/\r|\n/', $body, 2);
					
					//now set up and send teh email
					$mail = new Zend_Mail();
					
					//set the to address and the user's full name in the 'to' line
					//echo "<br/> here at user email address: ".$this->email."<br/>";
					$mail->addTo('michigan.acupuncture@gmail.com', trim('vincent'));
					
					//get the admin 'from details form teh config
					$mail->setFrom('michigan.acupuncture@gmail.com', 'Michigan-Acupuncture');
					
					//set the subject and boy and send the mail
					$mail->setSubject('Michigan-acupuncture online message');
					$mail->setBodyHtml(trim($body));
					$mail->send();
					$this->_forward('contactusconfirmation');
				}
			}
			
			$this->breadcrumbs->addStep('Contact Us');
			$this->view->fp = $fp;
			$this->view->mainHeader = 'CONTACT';

		}
		
		public function newslettersignupAction(){	
			$request=$this->getRequest(); //zend function returns all get and post items. 
			$email = $request->getPost('signupEmail');
			$validator = new Zend_Validate_EmailAddress();

			if($email!='' && $validator->isValid($email)){
				
				$newsletter_signup = new DatabaseObject_NewsletterSignup($this->db);
				
				if($newsletter_signup->loadByEmail($email)){
					if($newsletter_signup->promotion_used==0){
						$newsletter_signup->ts_end=date('Y-m-d G:i:s',mktime(0,0,0,date("m"),date("d")+14,date("Y")));
						$newsletter_signup->save();
					}
				}else{
				$newsletter_signup->ts_end=date('Y-m-d G:i:s',mktime(0,0,0,date("m"),date("d")+14,date("Y")));
				$newsletter_signup->email_signup = $email;
				$newsletter_signup->save();
				}
				//send email sign ups. 
				$templater = new Templater();			
				
				$templater->newsletter_signup=$newsletter_signup;

				$body = $templater->render('email/newsletter-signup.tpl');
list($subject, $body) = preg_split('/\r|\n/', $body, 2);
					
					//now set up and send teh email
				$mail = new Zend_Mail();
					
				//set the to address and the user's full name in the 'to' line
				//echo "<br/> here at user email address: ".$this->email."<br/>";
				$mail->addTo('michigan.acupuncture@gmail.com', trim('vincent'));
				$mail->addTo($newsletter_signup->email_signup, trim('user'));
				
				//get the admin 'from details form teh config
				$mail->setFrom('michigan.acupuncture@gmail.com', 'Michigan-Acupuncture');
				
				//set the subject and boy and send the mail
				$mail->setSubject('Michigan-acupuncture online message');
				$mail->setBodyHtml(trim($body));
				$mail->send();
				$this->_forward('newslettersignupconfirmation');
			}
		}
		
		public function contactusconfirmationAction(){
		}
		
		public function newslettersignupconfirmationAction(){
		}
		
		public function orderreviewAction(){
			$request=$this->getRequest(); //zend function returns all get and post items. 
			$order_id = $request->getParam('ID');
			echo 'order id is: '.$order_id;
			$fp = new FormProcessor_OrderReview($this->db, $order_id);
			
			if($request->isPost()) //zend function
			{
				if($fp->process($request))	//custom defined function in UserRegistration.php
				{
					//redirect 
					$templater = new Templater();			
		
					$review = new DatabaseObject_OrderReview($this->db);
					$review->loadByID($fp->review->getId());

					$templater->online_message=$review;

					
					//fetch teh e-amil body
					$body = $templater->render('email/order-review.tpl');
					
					//extract the subject from the first line
					list($subject, $body) = preg_split('/\r|\n/', $body, 2);
					
					//now set up and send teh email
					$mail = new Zend_Mail();
					
					//set the to address and the user's full name in the 'to' line
					//echo "<br/> here at user email address: ".$this->email."<br/>";
					$mail->addTo('VEdance.info@gmail.com', trim('VEdance'));
					//$mail->addTo('vinzha@gmail.com', trim('vincent'));
					//$mail->addTo('ericnathanyu@gmail.com', trim('eric'));
					
					//get the admin 'from details form teh config
					$mail->setFrom('VEdance.info@gmail.com', 'Info-VEdance');
					
					//set the subject and boy and send the mail
					$mail->setSubject('VEdance order review notice');
					$mail->setBodyHtml(trim($body));
					$mail->send();
					$this->_forward('orderreviewconfirmation');				
					}
			}
			//$this->view->order_id;
			$this->view->fp=$fp;
		}
		
		public function orderreviewconfirmationAction(){
			
		}
		
		public function calenderAction()
		{
		
		}
		
		public function errorAction(){
			echo 'you have an error in your selection';
		}
		
		public function policiesandreturnsAction(){
			
		}
		
		public function faqAction(){
			
		}
		
		public function testAction(){
			require('barcodegen/class/BCGFont.php');
			require('barcodegen/class/BCGColor.php');
			require('barcodegen/class/BCGDrawing.php'); 
			$text = $this->getRequest()->getParam('text');
			
			// Including the barcode technology
			include('barcodegen/class/BCGcode128.barcode.php');
			
			// Loading Font
			$font = new BCGFont('/library/barcodegen/class/font/Arial.ttf', 18);
			
			// The arguments are R, G, B for color.
			$color_black = new BCGColor(0, 0, 0);
			$color_white = new BCGColor(255, 255, 255); 
			
			$code = new BCGcode128();
			$code->setScale(2); // Resolution
			$code->setThickness(15); // Thickness
			$code->setForegroundColor($color_black); // Color of bars
			$code->setBackgroundColor($color_white); // Color of spaces
			$code->setFont($font); // Font (or 0)
			$code->parse($text); // Text
			
			
			/* Here is the list of the arguments
			1 - Filename (empty : display on screen)
			2 - Background color */
			$drawing = new BCGDrawing('', $color_white);
			$drawing->setBarcode($code);
			$this->_helper->viewRenderer->setNoRender(); 
			$this->getResponse()->setHeader('content-type','image/png');

			$drawing->draw();
			
			// Header that says it is an image (remove it if you save the barcode to a file)
			
			//header('Content-Type: image/png');
			
			// Draw (or save) the image into PNG format.
			$drawing->finish(BCGDrawing::IMG_FORMAT_PNG);
		}
		
		public function mailtestAction(){
		
					$mail = new Zend_Mail();
					
					//set the to address and the user's full name in the 'to' line
					//echo "<br/> here at user email address: ".$this->email."<br/>";
					//$mail->addTo('VEdance.info@gmail.com', trim('VEdance'));
					//$mail->addTo($param['email'], trim('user'));
					$mail->addTo('vinzha@gmail.com', trim('vincent'));
					$mail->addTo('ericnathanyu@gmail.com', trim('eric'));
				//	$mail->addTo($this->signedInUserSessionInfoHolder->generalInfo->email, trim('user'));
					//get the admin 'from details form teh config
					$mail->setFrom('VEdance administration', 'VEdance LLC');
					
					//set the subject and boy and send the mail
					$mail->setSubject('VEdance distributor application');
					$mail->setBodyHtml('test');
					$mail->send();	
		}
		
		public function promoemailAction(){
			$templater = new Templater();			
	
			
			$body = $templater->render('email/sponsor-promo.tpl');
			
			//extract the subject from the first line
			list($subject, $body) = preg_split('/\r|\n/', $body, 2);
			
			//now set up and send teh email
			$mail = new Zend_Mail();
			
			//set the to address and the user's full name in the 'to' line
			//echo "<br/> here at user email address: ".$this->email."<br/>";
			
			$myImage = file_get_contents('public/resources/css/images/VEpantsLogo4.png');
			//$file = $mail->createAttachment($myImage);
			//$file->filename='title';
			
			$mail->addTo('VEdance.info@gmail.com', trim('VEdance'));
			//$mail->addTo('vinzha@gmail.com', trim('vincent'));
			//$mail->addTo('ericnathanyu@gmail.com', trim('eric'));
			
			//get the admin 'from details form teh config
			$mail->setFrom('VEdance.info@gmail.com', 'Info-VEdance');
			
			//set the subject and boy and send the mail
			$mail->setSubject('VEdance promo ontice');
			$mail->setBodyHtml(trim($body));
			$mail->send();
			
		}
		
		
}
?>