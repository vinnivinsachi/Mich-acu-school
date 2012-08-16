<?php
	//pg 91
	class UtilityController extends CustomControllerAction
	{
	
		//utility controller is here to facilitate the generation of page contents. 
		//captchaActoin is to output an image during sign in. 
		//image is to output allsorts of images on to the main objects.
		public function captchaAction()
		{
			$session = new Zend_Session_Namespace('captcha');
			
			//check for existing phrase in session
			$phrase = null;
			if(isset($session->phrase) && strlen($session->phrase)>0)
			{
				$phrase = $session->phrase;
			}
			
			$captcha = Text_CAPTCHA::factory('Image');
			
			$opts = array('font_size'    =>    20,
						  'font_path'    =>    'public/resources/data',
						  'font_file'    =>    'VeraBd.ttf');
						  
			$captcha->init(120, 60, $phrase, $opts);
			
			//write the phrase to sessoin
			$session->phrase = $captcha->getPhrase();
			
							
			//disable auto-rendering since we're outputting an image
			$this->_helper->viewRenderer->setNoRender();
			header('Content-type: image/png');
			echo $captcha->getCAPTCHAAsPng();
		}
	}
?>