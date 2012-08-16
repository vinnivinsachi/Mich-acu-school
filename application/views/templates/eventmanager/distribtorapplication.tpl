{include file="layouts/$layout/header.tpl" lightbox=true}
<div id="bottomBody" style="background-color:#f3f3f3; width:898px;">

<div id="leftContainer" style="width:150px;">
<a href="{geturl action='setupapplication'}">Setup an application</a><br />
<a href="{geturl action='distribtorapplication'}">Distributors</a>


</div>

<div id='rightContainer' style='width:662px'>

<table width="100%">
    <tr>
        <td>Name</td>
       
        <td>Promotion type</td>
        <td>Application status</td>
        <td>Action</td>
    </tr>
    {foreach from=$users item=user}
    <tr>
        <td><a href="{geturl controller='eventmanager' action='setupapplication'}?id={$user.user_promotion_id}">{$user.name_of_organization}</a></td>
       
        <td>{if $user.promotion_type=='2'}Noneprofit organization{elseif $user.promotion_type=='1'}Commercial reseller{/if}</td>
        <td>{$user.promotion_application_status}</td>
      	<td><a href="{geturl controller='eventmanager' action='suspendapplication'}?id={$user.user_promotion_id}">Suspend</a>
    
    </tr>
    {/foreach}
</table>
</div>

</div>
{include file="layouts/$layout/footer.tpl"}