{include file="layouts/$layout/header.tpl" lightbox=true}
<div id="bottomBody"  style="background-color:#f3f3f3;">
<div id="leftContainer" style="width:250px;">
</div>

<div id='rightContainer' style='width:562px'>

	<form action="{geturl controller='account' action='applyforpromotioncode'}" method='post' style="margin-top:30px; float:left;">
    
    <div class="box">
    <label>Please select the type of promotion that you wish to apply. </label>
    <input type="radio" name="promotion_type" value="1" {if $applicationForm->promotion_type==1}checked="checked"{/if} />Commercial reseller/distribution promotion type 1<br />

	<input type="radio" name="promotion_type" value="2" {if $applicationForm->promotion_type==2}checked="checked"{/if} />Noneprofit organization partner promotion type 2<br /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('promotion_type')}

<br />
	</div>
    
    <div class="box">
    <label>Name of organization</label>
    <input type="text" name="name_of_organization" value="{$applicationForm->name_of_organization}" /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('name_of_organization')}

    <label>Address:</label>
	<input type="text" name="address_one" value="{$applicationForm->address_one}"/><br />
        {include file='partials/error.tpl' error=$applicationForm->getError('address_one')}

    <label>City:</label>
	<input type="text" name="city" value="{$applicationForm->city}" /><br/>
        {include file='partials/error.tpl' error=$applicationForm->getError('city')}

    <label>State:</label>
    <input type="text" name="state" value="{$applicationForm->state}" /><br />
        {include file='partials/error.tpl' error=$applicationForm->getError('state')}

    <label>Zip:</label>
    <input type="text" name="zip" value="{$applicationForm->zip}" /><br />
        {include file='partials/error.tpl' error=$applicationForm->getError('zip')}

    <label>Country:</label>
    <input type="text" name="country" value="{$applicationForm->country}" /><br />
        {include file='partials/error.tpl' error=$applicationForm->getError('country')}

    <label>Phone #:</label>
	<input type="text" name="phone_number" value="{$applicationForm->phone_number}" /><br />
        {include file='partials/error.tpl' error=$applicationForm->getError('phone_number')}

    </div>
    
    
    {if $applicationForm->user_promotion_id}
    If you would like to reapply for a new promotion code or update your delivery address, please click reapply. <br />
    <input type="submit" value="Reapply" style="margin-left:200px;" />
    {else}
    <input type="submit" value="Apply" style="margin-left:200px;" />
    {/if}
    
    <br /><br />
<br />


    <div class="box">
    {if $applicationForm->promotion_application_status==Completed}
    This application is approved and your promotion code is: {$applicationForm->promotion_code.0.profile_value}
    	{else}
    We will contact you in the next 2-3 business days to verify your eligibility and status. If you have any questions, please email VEdance.info@gmail.com. <br />
	{/if}
    </div>
    </form>
</div>

</div>

{include file="layouts/$layout/footer.tpl"}