{include file="layouts/$layout/header.tpl" lightbox=true}

<div id="bottomBody" style="background-color:#f3f3f3; width:900px;">
{include file='adminaccount/_partials/leftContainer.tpl'}

<div id='rightContainer' style='width:562px;'>
	{if $currentUser}
    	{$currentUser->first_name}
        {$currentUser->last_name}
    
    {/if}



    {foreach from=$generalSellers item=generalSeller}
        {$generalSeller.first_name}
        {$generalSeller.last_name}<br />
    {/foreach}
    
    {foreach from=$storeSellers item=storeSellers}
    	{$storeSellers.first_name}
    	{$storeSellers.last_name}<br />
    {/foreach}
</div>
</div>
{include file="layouts/$layout/footer.tpl"}