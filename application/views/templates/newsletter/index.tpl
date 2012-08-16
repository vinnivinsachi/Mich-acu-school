{include file="layouts/$layout/header.tpl" lightbox=true}

<table style="float:left; width:100%;">

	<tr>
    	<td>Id:</td>
    	<td>Email:</td>
        <td>Code:</td>
        <td>Expiration:</td>
        <td>Came?</td>
        <td>Actions:</td>
    </tr>
    {foreach from=$newsletterSubscribers item=subscriber}
    <tr>
    	<td>{$subscriber.newsletter_signup_id}</td>
    	<td>{$subscriber.email_signup}</td>
        <td>{$subscriber.promotion_id}</td>
        <td>{$subscriber.ts_end}</td>
        <td>{if $subscriber.promotion_used==0}No{else}Yes{/if}</td>
        <td><a href="{geturl controller='newsletter' action='markascame'}?id={$subscriber.newsletter_signup_id}">Came</a> | 
        <a href="{geturl controller='newsletter' action='markasuncame'}?id={$subscriber.newsletter_signup_id}">Take back</a> 
        </td>
        
    </tr>
    {/foreach}
</table>

{include file="layouts/$layout/footer.tpl"}