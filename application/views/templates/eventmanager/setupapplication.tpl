{include file="layouts/$layout/header.tpl" lightbox=true}
<div id="bottomBody"  style="background-color:#f3f3f3;">
<div id="leftContainer" style="width:250px;">
<a href="{geturl action='setupapplication'}">Setup an application</a><br />
<a href="{geturl action='distribtorapplication'}">Distributors</a>

</div>

<div id='rightContainer' style='width:562px'>

	<form action="{geturl controller='eventmanager' action='setupapplication'}" method='post' style="margin-top:30px; float:left;">
    
    <div class="box">
    <label>Please select the type of promotion that you wish to apply. </label>
    <input type="radio" name="promotion_type" value="1" {if $applicationForm->promotion_type==1}checked="checked"{/if} />Commercial reseller/distribution promotion type 1<br />

	<input type="radio" name="promotion_type" value="2" {if $applicationForm->promotion_type==2}checked="checked"{/if} />Noneprofit organization partner promotion type 2<br /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('promotion_type')}

<br />
	</div>
    
    <div class="box">
    <label>Please select the type of organization. This will help us decide what kind of organziation it is. </label>
    <input type="radio" name="organization_type" value="reseller" {if $applicationForm->organization_type=='reseller'}checked="checked"{/if} />Reseller<br />

	<input type="radio" name="organization_type" value="none commercial organizations" {if $applicationForm->organization_type=='none commercial organizations'}checked="checked"{/if} />None commercial organizations<br />
    <input type="radio" name="organization_type" value="universities" {if $applicationForm->organization_type=='universities'}checked="checked"{/if} />Universities<br />
    
    {include file='partials/error.tpl' error=$applicationForm->getError('organization_type')}

<br />
	</div>
    
    
    
    <div class="box">
    <label>Name of organization</label>
    <input type="text" name="name_of_organization" value="{$applicationForm->name_of_organization}" /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('name_of_organization')}
    
    <label>Primary contact</label>
    <input type="text" name="primary_contact" value="{$applicationForm->primary_contact}" /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('primary_contact')}

	<label>Phone #:</label>
	<input type="text" name="phone_number" value="{$applicationForm->phone_number}" /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('phone_number')}
    
    <label>Email #:</label>
	<input type="text" name="email" value="{$applicationForm->email}" /><br />
    {include file='partials/error.tpl' error=$applicationForm->getError('email')}
	
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

	<label>Website</label>
    <input type='text' name='organization_website' value='{$applicationForm->organization_website}'/><br />


    <label>Last time updated:</label>
    
    <label>{$applicationForm->last_updated}</label>

    </div>
    
    <input type="hidden" name="id" value="{$applicationForm->applicationID}" />
    <input type="hidden" name="status" value="{$applicationForm->promotion_application_status}"  />
    {if $applicationForm->user_promotion_id}
    <input type="submit" value="Save and reapply" style="margin-left:200px;" />
    {else}
    <input type="submit" value="Apply" style="margin-left:200px;" />
    {/if}
    
    <br /><br />
<br />


    <div class="box">
   

    {if $applicationForm->promotion_application_status==Completed}
     Application status: {$applicationForm->promotion_application_status}<br />

    Application promotion code is: {$applicationForm->promotion_code.0.profile_value}
    	
	{else}
     Application status: {$applicationForm->promotion_application_status} <a href="/eventmanager/setupdistribtorapplication?applicationID={$applicationForm->applicationID}&amp;promotionType={$applicationForm->promotion_type}">setup</a>
    
    {/if}
    </div>
    </form>
</div>

</div>

{include file="layouts/$layout/footer.tpl"}