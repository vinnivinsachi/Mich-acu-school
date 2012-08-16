{include file="layouts/$layout/header.tpl" lightbox=true}


{include file='index/_partials/leftContainer.tpl'}

<div id="rightContainer" class="box">
    {foreach from=$availableTags item=tag key=tagKey}
		<div id="postTagID-{addunderscore phrase=$tag.tag}" class="postTagSections box {if $tagKey!=0 && $currentTag!=$tag}hidden{/if}">
        {foreach from=$posts item=post key=Tag}
        	{if $Tag==$tag.tag}
                    {foreach from=$post item=postItem}
                    <div class="box" style="float:left; margin-bottom:15px;">

                        <div class="post-header" style="float:left; width:735px;">
                        	<span>
                            {$postItem.title}
                            </span>
                            {if $authenticated}
                            <a href="{geturl controller='blogmanager' action='edit'}?id={$postItem.post_id}" style="float:right; padding-right:20px;">
                            	<img src="/public/resources/css/images/edit.png"/>

                            </a>
                            {/if}
                        </div>
                        <div class="post-content" style="float:left; padding-right:20px;">
                            {$postItem.content}
                        </div>
                        <div class="post-remaining-images" style="float:left;">
                        	<ul class='post-images'>
                        		{foreach from=$postItem.images item='images'}
                                <li><a rel="{$Tag}" href="/public/resources/userdata/uploaded-files/{$images.username}/blogposts/{$images.image_id}.jpg" class="colorBox"><img src="/public/resources/userdata/tmp/thumbnails/{$images.username}/blogposts/{$images.image_id}.W150_homeFrontFour.jpg" /></a></li>
                                	
                            	{/foreach}
                            </ul>
                        </div>
                    </div>
                    {/foreach}
            {/if}
        {/foreach}
        	
        </div>
	{/foreach}
    
</div>
{include file="layouts/$layout/footer.tpl"} 