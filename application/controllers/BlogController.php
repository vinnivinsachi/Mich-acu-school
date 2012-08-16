<?php


	
	class BlogController extends CustomControllerAction
	{
		
		
		public function init(){
			$this->_redirect('/wordpress');
		}
	
		public function preDispatch()
		{
			
		}
	
	
		
}
?>