{if $isXmlHttpRequest}
		{if $tagPosts}
			{include file='eventmanager/lib/tag-preview.tpl posts=$tagPosts}
		{elseif $month}
		
			{include file='eventmanager/lib/month-preview.tpl month=$month posts=$recentPosts}
		{/if}
{else}

{include file="layouts/$layout/header.tpl" lightbox=true}


{if $totalPosts ==1}
	<p>
		There is currently <strong class="style1">1</strong> promotion in your blog.
	</p>
{else}
	<p>
		There are currenlty <strong class="style1">{$totalPosts}</strong> events. 
	</p>
{/if}
	
<form action="/eventmanager/edit" method="get">
	<div class="submit">
	<input type="submit" value="Create a new promotion" />
	</div>
</form>


<div id="month-preview">
	{if $tagPosts}
		{include file='eventmanager/lib/tag-preview.tpl posts=$tagPosts}
	{elseif $month}
		{include file='eventmanager/lib/month-preview.tpl month=$monthPost posts=$recentPosts}
	{else}
		<span class="contentTip">Please select from your categories and archives to view exisitng promotions
	{/if}
		
</div>

{include file="layouts/$layout/footer.tpl"}
{/if}