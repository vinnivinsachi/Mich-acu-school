<div id='leftContainer'>
<a href="{geturl controller='blogmanager' action='edit'}">Create a new post</a><br />

{get_tag_summary user_id=$uploader_id object="post_cat" assign=summary}

{if $summary|@count>0}
	<div id="preview-tags" class="box">
		<h3>Categories</h3>
		<ul>
			{foreach from=$summary item=tag}
			<li>
				<a href="{geturl controller='blogmanager'}?category={$tag.tag}">
				{$tag.tag|escape}
				</a>
				
				({$tag.count} post{if $tag.count != 1}s{/if})
			</li>
			{/foreach}
		</ul>
	</div>
<script type="text/javascript" src="/htdocs/js_plugin/BlogTagSummary.class.js"></script>
<script type="text/javascript">new BlogTagSummary('month-preview', 'preview-tags');</script>
	
{/if}

{get_tag_summary user_id=$uploader_id object="post" assign=summary}

{if $summary|@count>0}
	<div id="preview-tags2" class="box">
		<h3>Tags</h3>
		<ul>
			{foreach from=$summary item=tag}
			<li>
				<a href="{geturl controller='blogmanager'}?tag={$tag.tag}">
				{$tag.tag|escape}
				</a>
				
				({$tag.count} post{if $tag.count != 1}s{/if})
			</li>
			{/foreach}
		</ul>
	</div>
	
<script type="text/javascript" src="/htdocs/js_plugin/BlogTagSummary.class.js"></script>
<script type="text/javascript">new BlogTagSummary('month-preview', 'preview-tags2');</script>
	
{/if}

 

{get_monthly_blogs_summary user_id=$uploader_id object="post" assign=summary}

{if $summary|@count >0}
	<div id="preview-months" class="box">
		<h3>Your Post Archives</h3>
		<ul>
			{foreach from=$summary key=month item=numPosts}
				<li>
					<a href="{geturl controller='blogmanager'}?month={$month}">
						{$month|date_format:'%B %Y'}
					</a>
					({$numPosts} post{if $numPosts!=1}s{/if})
				</li>
			{/foreach}
		</ul>
	</div>
	
<script type="text/javascript" src="/htdocs/js_plugin/BlogMonthlySummary.class.js"></script>
<script type="text/javascript">new BlogMonthlySummary('month-preview', 'preview-months');</script>
	
	
{/if}

</div>