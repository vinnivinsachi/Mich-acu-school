<div id="leftContainer" style="width:250px;">




    <div class="secondaryHeader">
        <a style="padding-left:25px;">{$category}</a>
    </div>
    <div id='subCategory'>
    	{foreach from=$availableTags item=tag key=tagKey}
    	<div class="subCategoryHeader {if $tagKey==0}categoryActive{/if}" onclick={literal}"togglePostFromTag(this)"{/literal}>
        	<div id="tagID-{addunderscore phrase=$tag.tag}" >{$tag.tag}</div>
        </div>
        {/foreach}
       
    </div>
</div>