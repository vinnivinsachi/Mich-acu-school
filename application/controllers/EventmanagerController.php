<?php

	class EventmanagerController extends CustomControllerAction
	{
		protected $databaseColumn='event_id';
	
		public function init()
		{
			parent::init();
			
			$this->breadcrumbs->addStep('promotion manager', $this->getUrl(null, 'eventmanager'));
			$this->identity=Zend_Auth::getInstance()->getIdentity();
			$user = new DatabaseObject_User($this->db);
			//echo $this->signedInUserSessionInfoHolder->generalInfo->userID; 
			//if($user->loadByUserId($this->signedInUserSessionInfoHolder->generalInfo->userID))
			//{
			//$this->view->clubManager =$user;
			//}
			$_SESSION['categoryType'] = 'event';
		
		}
	
		public function indexAction()
		{
			$tag = $this->getRequest()->getQuery('tag');

			$month = $this->getRequest()->getQuery('month');
			
			$totalPosts = DatabaseObject_Event::GetObjectsCount($this->db, array('uploader_id'=>$this->signedInUserSessionInfoHolder->generalInfo->userID)); 			

			if(isset($tag) && !isset($month))
			{
				////echo "tag: ".$tag;
				$options = array(
				'user_id' =>$this->signedInUserSessionInfoHolder->generalInfo->userID,
				'tag' =>$tag,
				'status' =>DatabaseObject_BlogPost::STATUS_LIVE,
				'order' =>'p.ts_created desc');
			
				$recentPosts = DatabaseObject_Event::GetObjects($this->db, $options);
			
				$this->view->tagPosts = $recentPosts;
				$this->view->tag = $tag;

			}


			if(isset($month) && !isset($tag))
			{
				
				if(preg_match('/^(\d{4})-(\d{2})$/', $month, $matches))
				{
					$y = $matches[1];
					$m = max(1, min(12, $matches[2]));
				}
				else
				{
					$y = date('Y'); //current year
					$m = date('n'); //current month
				}
				
				$from=mktime(0,0,0, $m, 1, $y);
				
				$to = mktime(0,0,0,$m+1,1,$y)-1;
				
				$options=array('user_id' =>$this->signedInUserSessionInfoHolder->generalInfo->userID,
							   'from'=>date('Y-m-d H:i:s', $from),
							   'to' =>date('Y-m-d H:i:s', $to),
							   'order' =>'p.ts_created desc');
				
				$recentPosts = DatabaseObject_Event::GetObjects($this->db, $options);
				
				//get the total number of posts for this user
				
				
				$this->view->month = $from;
				$this->view->recentPosts = $recentPosts;
			}
			
			$this->view->totalPosts = $totalPosts;
	
		}	
			
		public function editAction()
		{
			$request = $this->getRequest();
			
			$event_id = $request->getQuery('id');
			
			
			$fp = new FormProcessor_Event($this->db, $this->signedInUserSessionInfoHolder->generalInfo->userID, $event_id);
			
			if($request->isPost())
			{
				////echo "<br/> Posted";
				if($fp->process($request))
				{
					$url=$this->getUrl('preview').'?id='.$fp->event->getId();
					$this->_redirect($url);
				}
				else
				{
					//echo "you have an ERROR in your post!!!!";
				}
			}
			
			if($fp->event->isSaved())
			{
				////echo"<br/> you are at $fp->post->isSaved())";
				$this->breadcrumbs->addStep('Preview Event: '.$fp->event->profile->name, 
				$this->getUrl('preview').'?id='.$fp->event->getId());
				
				$this->breadcrumbs->addStep('Edit Event');
			}
			else
			{
				$this->breadcrumbs->addStep('Create a New Event');
			}
			
			$this->view->fp = $fp;
		}
		
		public function previewAction()
		{
			$request=$this->getRequest();
			
			$id = (int)$request->getQuery('id');
			
			$event = new DatabaseObject_Event($this->db);
			
			if(!DatabaseObject_StaticUtility::loadObjectForUser($event, $this->signedInUserSessionInfoHolder->generalInfo->userID, $id, $this->databaseColumn))
			{
				$this->_redirect($this->getUrl());
			}
			
			$tags = DatabaseObject_StaticUtility::getTagsForObject($event, 'events_tags', 'event_id'); 
			
			
			$event->getImages();
			
			$this->breadcrumbs->addStep('Preview Post: '.$event->profile->name);
			$this->view->tags = $tags;
			
			$this->view->event = $event;
			
		
		}
		
		public function setstatusAction()
		{
			$request=$this->getRequest();
			
			$event_id =(int) $request->getPost('id'); //grabbing stuff form post.
			
			
			$event = new DatabaseObject_Event($this->db);
			
			if(!DatabaseObject_StaticUtility::loadObjectForUser($event, $this->signedInUserSessionInfoHolder->generalInfo->userID, $event_id, $this->databaseColumn))
			{
				$this->_redirect($this->getUrl());
			}
			
			$url = $this->getUrl('preview').'?id='.$event->getId();
			
			if($request->getPost('edit')) //grabbing stuff from post.
			{
				$this->_redirect($this->getUrl('edit').'?id='.$event->getId());
			}
			else if($request->getPost('publish'))
			{
				DatabaseObject_StaticUtility::setObjectStatusAction($event, 'publish');
				$this->messenger->addMessage('Event sent live');
			}
			else if($request->getPost('unpublish'))
			{
				DatabaseObject_StaticUtility::setObjectStatusAction($event, 'unpublish');
				$this->messenger->addMessage('Event unpublished');
			}
			else if($request->getPost('delete'))
			{
				
				DatabaseObject_StaticUtility::setObjectStatusAction($event, 'delete');
				//Preview page no longer exists for this page so go back to index.
				$url = $this->getUrl();
				$this->messenger->addMessage('Post deleted');
			}
			
			
			$this->_redirect($url);
		}
		
	
		public function testAction()
		{
			$request=$this->getRequest();
			
			$id=$request->getQuery('id');
			
			$event = new DatabaseObject_Event($this->db);
			$event->eventTestLoad($id);
			$event->delete();
		}
		
		public function tagsAction()
		{
			$request= $this->getRequest();
			
			$post_id = (int) $request->getPost('id');
			
			$post = new DatabaseObject_Event($this->db);
			

		    
			if(!DatabaseObject_StaticUtility::loadObjectForUser($post, $this->signedInUserSessionInfoHolder->generalInfo->userID, $post_id, $this->databaseColumn))
			{
				$this->_redirect($this->getUrl());
			}
			
			$tag = $request->getPost('tag');
		
			if($request->getPost('add'))
			{
			
				DatabaseObject_StaticUtility::addTagsToObject('events_tags', $post, $tag, 'event_id');
				
				$this->messenger->addMessage('Category added to post');
			}
			else if($request->getPost('delete'))
			{
				DatabaseObject_StaticUtility::deleteTagsForObject('events_tags', $post, $tag, 'event_id');
				$this->messenger->addMessage('Category removed form post');
			}
			
			$this->_redirect($this->getUrl('preview').'?id='.$post->getId());
			
		}
		
		
		
		public function imagesAction()
		{
			$request=$this->getRequest();
			
			$json = array();
			

			$post_id=(int) $request->getPost('id');
			
			$post = new DatabaseObject_Event($this->db);
			
			if(!DatabaseObject_StaticUtility::loadObjectForUser($post, $this->signedInUserSessionInfoHolder->generalInfo->userID, $post_id, $this->databaseColumn))
			{
				$this->_redirect($this->getUrl());
			}
			
			////echo "here1";
			if($request->getPost('upload'))
			{
				$fp=new FormProcessor_Image($post);
				if($fp->process($request))
				{
					$this->messenger->addMessage('Image uploaded');
				}
				else
				{
					foreach($fp->getErrors() as $error)
					{
						$this->messenger->addMessage($error);
					}
				}
			}
			else if($request->getPost('reorder'))
			{
				
				$order=$request->getPost('post_images');
				$post->setImageOrder($order);
				////echo "you are at after setimageorder";
				
			}
			else if($request->getPost('delete'))
			{
				
				$image_id = (int) $request->getPost('image');
				
				
				$image = new DatabaseObject_Image($this->db);
				
				if($image->loadForPost($post->getId(), $image_id))
				{
					$image->delete(); //the files are unlinked/deleted at preDelete.
					////echo "image at delete";
					
					if($request->isXmlHttpRequest())
					{
						$json = array('deleted' =>true, 'image_id' =>$image_id);
					}
					else
					{
					$this->messenger->addMessage('Image deleted');
					}
				}
				
			}
			
			if($request->isXmlHttpRequest())
			{
				$this->sendJson($json);
			}
			else
			{
			
			$url = $this->getUrl('preview').'?id='.$post->getId();
			$this->_redirect($url);
			}
		}
		
		public function distribtorapplicationAction(){
			$users = DatabaseObject_Helper_UserManager::loadDistributorApplication($this->db);
			$this->view->users=$users;
			//Zend_Debug::dump($users);
		}
		
		public function setupapplicationAction(){
			
			$request= $this->getRequest();
			
			$promotionID = $request->getParam('id');
			//$currentApplication = DatabaseObject_Helper_UserManager::userApplicationRetrieval($this->db, $this->signedInUserSessionInfoHolder->generalInfo->userID);
			
			//Zend_Debug::dump($currentApplication);
			if(isset($promotionID) && $promotionID!='' && is_numeric($promotionID)){
			//echo "here at promotion ID";
			$promotionApplication = new FormProcessor_PromotionApplication($this->db, $promotionID);
			
			}else{
			//echo "here at new promotion application";
			$promotionApplication = new FormProcessor_PromotionApplication($this->db);

			}
			
			
			
			//Zend_Debug::dump($promotionApplication);
			if($request->isPost()){
			//	echo 'here at post';
				if($promotionApplication->process($request)){
							//send 
							
							//confirmation email
						 
							/*$templater = new Templater();			
							//Zend_Debug::dump($promotionApplication);
							$templater->online_message=$promotionApplication->application[0];
							//Zend_Debug::dump($promotionApplication->application[0]);
							//fetch teh e-amil body
							$body = $templater->render('email/vendor-registration.tpl');
							//extract the subject from the first line
							list($subject, $body) = preg_split('/\r|\n/', $body, 2);
							//now set up and send teh email
							$mail = new Zend_Mail();
							//set the to address and the user's full name in the 'to' line
							//echo "<br/> here at user email address: ".$this->email."<br/>";
							//$mail->addTo('VEdance.info@gmail.com', trim('VEdance'));
							//$mail->addTo($param['email'], trim('user'));
							$mail->addTo('vedance.info@gmail.com', trim('VEdance'));
							//$mail->addTo('ericnathanyu@gmail.com', trim('eric'));
							$mail->addTo($this->signedInUserSessionInfoHolder->generalInfo->email, trim('user'));
							//get the admin 'from details form teh config
							$mail->setFrom('VEdance administration', 'VEdance LLC');
							
							//set the subject and boy and send the mail
							$mail->setSubject('VEdance promotion request application');
							$mail->setBodyHtml(trim($body));
							$mail->send();
							
							$this->_forward('applicationsend');*/
							$this->_redirect($this->getUrl('setupapplication').'?id='.$promotionApplication->user_promotion_id);

				}else{
					//$this->_forward('applicationalreadysent');	
				}
	
					
			}
				
				//$this->view->currentApplication=$promotionApplication->application[0];
				//Zend_Debug::dump($promotionApplication);
				$this->view->applicationForm = $promotionApplication;
		}
		
		public function suspendapplicationAction(){
			$id=$this->getRequest()->getParam('id');
			
			DatabaseObject_Helper_UserPromotionManager::updatePromotionApplicationStatus($this->db, 'SUSPENDED', $id);
			$this->messenger->addMessage('Promotion Code Suspended');
			$this->_redirect($_SERVER['HTTP_REFERER']);

		}
		
		
		public function setupdistribtorapplicationAction(){
			$event = new DatabaseObject_Event($this->db);
			$applicationID=$this->getRequest()->getParam('applicationID');
			$promotion_type = $this->getRequest()->getParam('promotionType');
			$event->uploader_id=$this->signedInUserSessionInfoHolder->generalInfo->userID;
			$event->url='applicationID_'.$applicationID;
			$event->ts_created=date('Y-m-d G:i:s');
			$event->ts_end=date('Y-m-d G:i:s',mktime(0,0,0,date("m"),date("d")+14,date("Y")+5));
			$event->status='P';
			$event->profile->name="applicationID_".$applicationID."_code";
			$event->profile->promotion_code=Text_Password::create(10, 'unpronounceable');
			$code = $event->profile->promotion_code;
			if($promotion_type==2){
				$event->profile->percentage=26.6666;
			}elseif($promotion_type==1){
				$event->profile->percentage=33.3333;
			}
			$event->profile->price="0";
			$event->save();
			
			DatabaseObject_Helper_UserManager::assignCreatedPromotionCode($this->db, $applicationID, $event->getId());
			$vendorInfo=DatabaseObject_Helper_UserManager::retrieveEmailForPromotionCode($this->db, $applicationID);
			
			
			//Zend_Debug::dump($vendorInfo);
			//Zend_Debug::dump($event);
			//send out confirmation email. 
					
					
					/*$templater = new Templater();			
							
					$templater->code=$code;
					$templater->user = $vendorInfo;
					//fetch teh e-amil body
					$body = $templater->render('email/vendor-confirmation.tpl');
					
					//extract the subject from the first line
					list($subject, $body) = preg_split('/\r|\n/', $body, 2);
					
					//now set up and send teh email
					$mail = new Zend_Mail();
					
					//set the to address and the user's full name in the 'to' line
					//echo "<br/> here at user email address: ".$this->email."<br/>";
					$mail->addTo('VEdance.info@gmail.com', trim('VEdance'));
					//$mail->addTo($param['email'], trim('user'));
					//$mail->addTo('vinzha@gmail.com', trim('vincent'));
					//$mail->addTo('ericnathanyu@gmail.com', trim('eric'));
					//$mail->addTo($this->signedInUserSessionInfoHolder->generalInfo->email, trim('user'));
					//get the admin 'from details form teh config
					$mail->setFrom('VEdance administration', 'VEdance LLC');
					
					//set the subject and boy and send the mail
					$mail->setSubject('VEdance distributor application');
					$mail->setBodyHtml(trim($body));
					$mail->send();*/
					
					
			//end of sending confirmation email. 
			$this->messenger->addMessage('Promotion code had been set');
			$this->_redirect($_SERVER['HTTP_REFERER']);
			
		}
	}
?>