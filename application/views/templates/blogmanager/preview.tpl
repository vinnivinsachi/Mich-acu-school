{include file="layouts/$layout/header.tpl" lightbox=true}

<!--<script type="text/javascript" src="/htdocs/js_plugin/blogPreview.js"></script>
<script type="text/javascript" src="/htdocs/js_plugin/BlogImageManager.class.js"></script>
-->

{include file='blogmanager/lib/left-column.tpl'}
<div id='rightContainer'>
	<div class="box">

    <form method="post" action="{geturl controller='blogmanager' action='setstatus'}" id="status-form">
    
    <div class="preview-status">
        <input type="hidden" name="id" value="{$post->getId()}"/>
        
        {if $post->isLive()}
            <div class="status live">
                This post IS published. To unpublish it click the <strong>Unpublish Post</strong> button below.
                <div>
                    <input type="submit" value="Unpublish post" name="unpublish" id="status-unpublish">
                    <input type="submit" value="Edit post" name="edit" id="status-edit">
                    <input type="submit" value="Delete post" name="delete" id="status-delete">
                </div>
            </div>
        {else}
            <div class="status draft">
                This post is NOT published. To publish it on your blog, click the button below.
                <div>
                    <input type="submit" value="Publish post" name="publish" id="status-publish">
                    <input type="submit" value="Edit post" name="edit" id="status-edit">
                    <input type="submit" value="Delete post" name="delete" id="status-delete">
                </div>
            </div>
        {/if}
        
    </div>
    
    </form>
    
    <form method="get" action="{geturl action='edit'}">
    	
            <input type="submit" value="Create new blog posts"/>
    </form>


    <fieldset id="preview-categories">
        <legend>Categories</legend>
        
        <ul>
        
            {foreach from=$categories item=cat}
                <li>
        
                    <form method="post" action="{geturl action='categories'}">
                    <div>
                        <span style="color: black;">{$cat|escape}</span>
                        <input type="hidden" name="id" value="{$post->getId()}" />
                        <input type="hidden" name="category" value="{$cat|escape}" />
                        <input type="submit" name="delete" value="delete" />
                    </div>
                    </form>
                </li>
            {foreachelse} 
                No categories for this post
            {/foreach}
        </ul>
        
        <br/>
        
        <form method="post" action="{geturl action ='categories'}">
            <div>
                <input type="hidden" name="id" value="{$post->getId()}" />
                	<input name="category" />
                       
                <input type="submit" name="add" value="Add To Category" />
            </div>
        </form>
        
    </fieldset>

    <fieldset id="preview-tags">
        <legend>Tags</legend>
        
        <ul>
        
            {foreach from=$tags item=tag}
                <li>
        
                    <form method="post" action="{geturl action='tags'}">
                    <div>
                        <span style="color: black;">{$tag|escape}</span>
                        <input type="hidden" name="id" value="{$post->getId()}" />
                        <input type="hidden" name="tag" value="{$tag|escape}" />
                        <input type="submit" name="delete" value="delete" />
                    </div>
                    </form>
                </li>
            {foreachelse} 
                No tags for this post
            {/foreach}
        </ul>
        
        <br/>
        
        <form method="post" action="{geturl action ='tags'}">
            <div>
                <input type="hidden" name="id" value="{$post->getId()}" />
                	<input name="tag" />
                      
                        <input type="submit" name="add" value="Add To Tag" />
            </div>
        </form>
        
    </fieldset>
    
    </div>
    
    
    <div class="box">

        <div class="box">
        
        Title: {$post->profile->title}
        </div>
    
        <div class="box">
            Created: {$post->ts_created|date_format:'%x %X'}
        </div>
        
        <div class="box">
            Link to: {$post->profile->title_link}
        </div>
        
        <div class="box">
            {$post->profile->content}
        </div>

   </div>
			
</div>
{include file="layouts/$layout/footer.tpl"}