{include file="layouts/$layout/header.tpl" lightbox=true}

<div style="float:left; width:98.8%; background:#f3f3f3; padding:5px;">
	{include file='partials/indexTagHeader.tpl' indexTagHeaderTitleName="Shopping cart"}

	<div id="orderMainDiv" style="float:left; width:100%;">
    	            {if $shoppingCartProducts|@count>0}
    	
        	{include file='shoppingcart/_partials/_basketInformation.tpl'}
         {else}
            Your shopping cart is empty.
            {/if}
       	<!-- end of product forloop-->
        <div id="proceedShoppingCart" style="width:100%; float:left; text-align:right;">
         	<div class="box"><a href="{geturl action='resetshoppingcart'}" style="float:left; margin-top:10px;">Empty cart</a></div>
            {if $shoppingCartInfo->totalItems >0}
            
            <form action="{geturl controller='shoppingcart' action='index'}" method="post" style="width:600px; float:right; padding:10px;" id="guestShippingAddress" >

<!--            <form action="{geturl controller='checkout' action='index'}" method="post" style="width:300px; float:right; padding:10px;" >
-->               <p> Please enter your information to include in this order. 
This is a requirement for all orders.</p>
                
                <div style="width:50%; float:left;">
               <p> Your contact information:</p>
                    <div>
                    Name:
                    <input id='form_name' type=text name="buyer_name" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_name}{$fp->shippingAddress->buyer_name|escape}{else}Your name{/if}" onclick={literal}"if(this.value=='Your name'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_name')}
                    </div>    
                    <div>
                    Email:
                    <input id='form_email' type=text name="buyer_email" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_email}{$fp->shippingAddress->buyer_email|escape}{else}Email{/if}" onclick={literal}"if(this.value=='Email'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_email')}
                    </div>
                    
                    <div>
                    Phone number:
                    <input id='form_phone_number' type=text name="buyer_phone_number" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_phone_number}{$fp->shippingAddress->buyer_phone_number|escape}{else}Phone number{/if}" onclick={literal}"if(this.value=='Phone number'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_phone_number')}
    
                    </div>
                </div>
                
                <div style="width:50%; float:left;">
                <div id='youraddressptext' class="box"><p>Your address:</p></div>
                    <div>
                    Address:
                    <input id='form_address' type=text name="buyer_address" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_address}{$fp->shippingAddress->buyer_address}{else}Address{/if}" onclick={literal}"if(this.value=='Address'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_address')}
    
                    </div>
                    
                    <div>
                    City:
                    <input id='form_city' type=text name="buyer_city" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_city}{$fp->shippingAddress->buyer_city|escape}{else}City{/if}" onclick={literal}"if(this.value=='City'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_city')}
    
                    </div>
                    
                     <div>
                    State:
                    <input id='form_state' type=text name="buyer_state" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_state}{$fp->shippingAddress->buyer_state|escape}{else}State{/if}" onclick={literal}"if(this.value=='State'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_state')}
    
                    </div>
                    
                    <div>
                    Zip:
                    <input id='form_zip' type=text name="buyer_zip" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_zip}{$fp->shippingAddress->buyer_zip|escape}{else}Zip{/if}" onclick={literal}"if(this.value=='Zip'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_zip')}
    
                    </div>
                    
                    <div>
                    Country:
                    <input id='form_country' type=text name="buyer_country" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->shippingAddress->buyer_country}{$fp->shippingAddress->buyer_country|escape}{else}Country{/if}" onclick={literal}"if(this.value=='Country'){this.clear()}"{/literal}>
                    {include file='partials/error.tpl' error=$fp->getError('buyer_country')}
                    </div>
                </div>
                
        
        		<div style="float:right; margin-top:10px;">
                
                <button name="subscribe" style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer; float:left; width:150px;" >Next to checkout ></button>
                </div>

            </form>

			{literal}
    
				<script type="text/javascript">
                    new loginFormEnhancer('guestShippingAddress');
                </script>
            
            {/literal}
<!--        	<a href="{geturl controller='checkout' action='index'}" style="float:right; margin-top:10px;">Next to checkout ></a>
-->            {/if}
        </div>
    </div>
</div>

{include file="layouts/$layout/footer.tpl"}