{include file="layouts/$layout/header.tpl" lightbox=true}

{include file='blogmanager/lib/left-column.tpl'}
	
<div id="rightContainer">
{if $isXmlHttpRequest}
		{if $tagPosts}
			{include file='blogmanager/lib/tag-preview.tpl posts=$tagPosts}
		{elseif $month}
		
			{include file='blogmanager/lib/month-preview.tpl month=$month posts=$recentPosts}
		{/if}
{else}

	
	<div id="content">
	{if $totalPosts ==1}
		<p>
			There is currently <strong class="style1">1</strong> post in your blog.
		</p>
	{else}
		<p>
			There are currenlty <strong class="style1">{$totalPosts}</strong> posts. 
		</p>
	{/if}
	
	
	<form method="get" action="{geturl action='edit'}">
		<input type="submit" value="Create new entry"/>
	</form>
	
	<div id="month-preview">
		{if $tagPosts}
			{include file='blogmanager/lib/tag-preview.tpl posts=$tagPosts}
		{elseif $month}
			{include file='blogmanager/lib/month-preview.tpl month=$monthPost posts=$recentPosts}
		{else}
			<span class="contentTip">Please select from your categories and archives to view exisitng posts</span>
		{/if}
	</div>
	
	
	</div>
	
	
	
{/if}
</div>

{include file="layouts/$layout/footer.tpl"}