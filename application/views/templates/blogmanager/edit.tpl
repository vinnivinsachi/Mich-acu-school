{include file="layouts/$layout/header.tpl" lightbox=true}


{include file='blogmanager/lib/left-column.tpl'}
<div id='rightContainer'>


<form method="post" action="{geturl action='edit'}?id={$fp->post->getId()}" enctype="multipart/form-data" >
	
	{if $fp->hasError()}
		<div class="error">
			An error has occured in the form below. Please check the highlighted fields and resubmit the form.
		</div>
	{/if}
	
	<fieldset>
		<legend>Blog Post Details</legend>
		<a href="{geturl controller='blogmanager' action='preview'}?id={$fp->post->getId()}" style="float:right;">Preview</a>
		<div class="row" id="form_title_container">
			<label for="form_title">Title:</label>
			<input type="text" id="form_title" name="username" value="{$fp->title | escape}"/>
			{include file='partials/error.tpl' error=$fp->getError('title')}
		</div>
		
		<div class='row' id='form_langugage'>
			<input type='radio' name='language' value='EN' {if $fp->language=='EN'}checked="checked"{/if}/>English
			<input type='radio' name='language' value='CH' {if $fp->language=='CH'}checked="checked"{/if}/>Chinese
		</div>
		
		<div class="row" id="form_title_link">
			<label for="form_title">Title Link:</label>
			
			<select name="title_link">
			
			</select>
		</div> 
        
        <div class="row" id="form_location_conatiner">
        
        	<label for="form_location">Event Location:</label>
            <input type="text" id="form_location" name="location" value="{$fp->location|escape}"/>
			{include file='partials/error.tpl' error=$fp->getError('location')}
        </div>
        
        <div class="row" id="form_location_url_container">
        	<label for="form_location_url">Event Google Map URL:</label>
            <input type="text" id="form_location_url" name="location_url" value="{$fp->locationURL|escape}"/> 
        </div>
        
        <div class="row" id="form_facebook_url_container">
        	<label for="form_facebook_url">Facebook URL:</label>
            <input type="text" id="form_facebook_url" name="facebook_url" value="{$fp->facebookURL|escape}"/>
        </div>
        
		
		<div class="row" id="form_date_container">
			<label for="form_date">Date of Entry:</label>
			{html_select_date prefix='ts_created' time=$fp->ts_created start_year=-5 end_year=+5}
			
			{html_select_time prefix='ts_created'
							  time=$fp->ts_created
							  display_seconds = false
							  use_24_hours=false}
			
			{include file='partials/error.tpl' error=$fp->getError('date')}
		</div>
		
        <div class="row" id="form_startdate_container">
			<label for="form_startdate">Event Start Time:</label>
			{html_select_date prefix='ev_created' 
							  time=$fp->ts_created
							  start_year=-2
							  end_year=+2}
			
			{html_select_time prefix='ev_created'
							  time=$fp->ts_created
							  display_seconds = false
							  use_24_hours=false}
			
		</div>
		
		<div class="row" id="form_enddate_container">
			<label for="form_enddate">Event End Time:</label>
			{html_select_date prefix='ev_ended' 
							  time=$fp->ts_end

							  start_year=-2
							  end_year=+2}
			
			{html_select_time prefix='ev_ended'
							  time=$fp->ts_end
							  display_seconds = false
							  use_24_hours=false}
		</div>
		
		<div class="row" id="form_title_tag">
			<label>Title Tag</label>
			<input type="text" name="title_tag"/>
		</div>
        
		<div class="wysiwyg">
        
        	{literal}
            <!-- Load jQuery build -->
			<script type="text/javascript" src="/public/resources/jquery/tiny_mce/tiny_mce.js"></script>
            <script type="text/javascript">
            tinyMCE.init({
                    // General options
                    mode : "exact",
                    theme : "advanced",
					elements : "test",
					width : "720",
                    plugins : "pagebreak,style,layer,table,save,advhr,advimage,advlink,emotions,iespell,inlinepopups,insertdatetime,preview,media,searchreplace,print,contextmenu,paste,directionality,fullscreen,noneditable,visualchars,nonbreaking,xhtmlxtras,template",
            
                    // Theme options
                    theme_advanced_buttons1 : "save,newdocument,|,bold,italic,underline,strikethrough,|,justifyleft,justifycenter,justifyright,justifyfull,|,styleselect,formatselect,fontselect,fontsizeselect",
                    theme_advanced_buttons2 : "cut,copy,paste,pastetext,pasteword,|,search,replace,|,bullist,numlist,|,outdent,indent,blockquote,|,undo,redo,|,link,unlink,anchor,image,cleanup,help,code,|,insertdate,inserttime,preview,|,forecolor,backcolor",
                    theme_advanced_buttons3 : "tablecontrols,|,hr,removeformat,visualaid,|,sub,sup,|,charmap,emotions,iespell,media,advhr,|,print,|,ltr,rtl,|,fullscreen",
                    theme_advanced_buttons4 : "insertlayer,moveforward,movebackward,absolute,|,styleprops,|,cite,abbr,acronym,del,ins,attribs,|,visualchars,nonbreaking,template,pagebreak",
                    theme_advanced_toolbar_location : "top",
                    theme_advanced_toolbar_align : "left",
                    theme_advanced_statusbar_location : "bottom",
                    theme_advanced_resizing : true,
            
                    // Example content CSS (should be your site CSS)
                    content_css : "css/example.css",
            
                    // Drop lists for link/image/media/template dialogs
                    template_external_list_url : "js/template_list.js",
                    external_link_list_url : "js/link_list.js",
                    external_image_list_url : "js/image_list.js",
                    media_external_list_url : "js/media_list.js",
            
                    // Replace values for the template plugin
                    template_replace_values : {
                            username : "Some User",
                            staffid : "991234"
                    }
            });
            </script>
            {/literal}
            
            
			 <textarea id='test' name="content" mce_editable="true" style="width:100%">{$fp->content}
        	 </textarea>
		</div>
		
	</fieldset>
	
	
    <div id="imageBlock">
        <div id="image_0" class="imageInput">
        <label>Image :</label>
			<input type="file" name="generalImages[0]" />
		<button type='button'onclick='	this.up().remove();'>Delete</button>
		</div>
	</div>
	
	<button type='button' id='addAnotherImage' onclick='addNewImageBlock()'>Add another image</button>
	
	<br/>
	
	<input type='submit' name='save' value='save and proceed' onclick=showloadingImage() />
	
	
</form>

{if $fp->post->images|@count>0}
            <ul id="post_images">
                {foreach from=$fp->post->images item=image}
                    <li >
                        <img src="/public/resources/userdata/tmp/thumbnails/{$signedInUser->generalInfo->username}/blogposts/{$image.image_id}.W150_homeFrontFour.jpg" alt="{$image.filename}" />
                        <form id='imageForm' method="post" action="{geturl action='images'}">
                            <div>
                                <input type="hidden" name="id" value="{$fp->post->getId()}" />
                                <input type="hidden" name="tag" value="blogposts" />
                                <input type="hidden" name='image_type' value="blog_posts_images" />
                                <input type="hidden" name="image" value="{$image.image_id}" />
                                <input type='submit' name='delete' value='delete' onclick=showloadingImage() />
                            </div>
                        </form>
                    </li>
                {/foreach}
            </ul>
        {else}
        no general images uploaded
        {/if}
        

</div>

{include file="layouts/$layout/footer.tpl"}