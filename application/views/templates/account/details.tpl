{include file="layouts/$layout/header.tpl" lightbox=true}
{literal}
<script src="/public/resources/javascripts/slidemenu.js" type="text/javascript"></script>

{/literal}
<div id="bottomBody" style="background-color:#f3f3f3;">

<div id="leftContainer" style="width:250px;">



</div>

<div id='rightContainer' style='width:750px;'>
	
    <fieldset> 	
	<legend>Account-Info</legend>
    First name: {$user->generalInfo->first_name}<br />
	Last name: {$user->generalInfo->last_name}<br />
    username: {$user->generalInfo->username}<br />
    usertype:	{$user->generalInfo->user_type} <br />
    password: XXXXXXX<br />
    Email: {$user->generalInfo->email}<br />
    Gender: {$user->generalInfo->sex}<br />
    ---Optional info---<br />
    Affilitions: {$user->generalInfo->affiliation}<br />
	Dance experience: {$user->generalInfo->experience}<br />
    <a href="{geturl controller='account' action='editbasicinfo'}">Edit</a>
	</fieldset>  
    
    {if $user->generalInfo->user_type =='generalSeller' ||$user->generalInfo->user_type =='storeSeller'} 
    <fieldset>
    	<legend>Sellers Information</legend>
        Paypal Email: {$user->sellerInfo->paypal_email}<br />
        
        Status: {if $user->sellerInfo->verified =='0' || !isset($user->sellerInfo->verified)}Need to verify! <a href="{geturl action='verifyselleraccount'}?sUqid={$user->sellerInfo->unique_identifier}">Send Verification Email</a>{else}VERIFIED{/if}<br />
		Phone number: {$user->sellerInfo->phone_number}<br />
		{$user->sellerInfo->address_one}<br />
        {if $user->sellerInfo->address_two!=''}
		{$user->sellerInfo->address_two}<br />
        {/if}
        {$user->sellerInfo->city}, {$user->sellerInfo->state} {$user->sellerInfo->zip}<br />
        {$user->sellerInfo->country}<br />
        {if $user->generalInfo->user_type =='generalSeller'}
        <a href="{geturl controller='account' action='upgradegeneralseller'}">Edit</a><br />
        {elseif $user->generalInfo->user_type =='storeSeller'}
        <a href="{geturl controller='account' action='upgradestoreseller'}">Edit</a><br />
        {/if}
  	</fieldset>
    {/if}
    
    
    <fieldset>
        <legend>Current Address</legend>
        {if $defaultShippingKey}
        {$user->generalInfo->shippingAddress[$defaultShippingKey]->address_one}<br />
         {if $user->generalInfo->shippingAddress[$defaultShippingKey]->address_two!=''}
        {$user->generalInfo->shippingAddress[$defaultShippingKey]->address_two}<br />
        {/if}
        {$user->generalInfo->shippingAddress[$defaultShippingKey]->city}, {$user->generalInfo->shippingAddress[$defaultShippingKey]->state} {$user->generalInfo->shippingAddress[$defaultShippingKey]->zip} <br />
        {$user->generalInfo->shippingAddress[$defaultShippingKey]->country}<br />
        <a href="{geturl controller='account' action='editshipping'}?editAddress={$defaultShippingKey}">Edit</a>
        <a href="{geturl controller='account' action='deleteshipping'}?editAddress={$defaultShippingKey}">Delete</a><br />
		{else}
        There is no Default Shipping Address
        {/if}
    </fieldset>
    <fieldset>
     	<legend>All Shipping Addresses</legend><br />
        {foreach from=$user->generalInfo->shippingAddress item=Item key=Key}
        <div class="shippingAddressBox">
            {$user->generalInfo->shippingAddress[$Key]->address_one}<br />
            {if $user->generalInfo->shippingAddress[$Key]->address_two!=''}
            Address Two: {$user->generalInfo->shippingAddress[$Key]->address_two}<br />
            {/if}
           {$user->generalInfo->shippingAddress[$Key]->city}, {$user->generalInfo->shippingAddress[$Key]->state} {$user->generalInfo->shippingAddress[$Key]->zip}
           {$user->generalInfo->shippingAddress[$Key]->country}<br />
            <a href="{geturl controller='account' action='editshipping'}?editAddress={$Key}">Edit</a>
            <a href="{geturl controller='account' action='deleteshipping'}?editAddress={$Key}">Delete</a>
            {if $defaultShippingKey!=$Key}
            <a href="{geturl controller='account' action='makedefaultshipping}?editAddress={$Key}">Make Default</a><br />
            {else}
            <br />
            {/if}
        </div>
        {/foreach}
        <div style="float:left; width:100%;"><a href="{geturl controller='account' action='editshipping'}">Add a shipping address</a></div>
    </fieldset>
     
     <fieldset>
    	<legend>Account Actions</legend>
    		{if $user->generalInfo->user_type =='member'}
            <a href="{geturl controller='account' action='applyforpromotioncode'}">Apply for a reseller/partner/non-profit promotion code</a><br />
            {/if}
            
         </form>
    </fieldset>
            
      
</div>

{literal}
<script type="text/javascript">
new individualToggle('rewardPointTracking', 'trackRewardPointDiv', 'currentSelection', Array('pruchaseRewardPointDiv'), Array('rewardPointPurchase'));

new individualToggle('rewardPointPurchase', 'pruchaseRewardPointDiv', 'currentSelection', Array('trackRewardPointDiv'), Array('rewardPointTracking'));		
new individualToggle('referalMessageSelection', 'referalForm', 'currentSelection', Array('referalTracking'), Array('referalViewFriends'));
new individualToggle('referalViewFriends', 'referalTracking', 'currentSelection', Array('referalForm'), Array('referalMessageSelection'));	

</script>

{/literal}


{include file="layouts/$layout/footer.tpl"}