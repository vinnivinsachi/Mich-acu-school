{include file="layouts/$layout/header.tpl" lightbox=true}


<div id="bottomBody" style="background-color:#f3f3f3; width:898px;">

    <div id="leftContainer" style="width:250px;">

		<form method=get name="subscribeform" action="{geturl controller='ordermanager' action='guestorders'}" style="float:left; width:100%;">
        <div class="attributeinput" style="width:145px; float:left;">
        <input type=text name='id' style="height:30px; width:145px;" value="Order id" style="color:#cccccc;" onclick={literal}"if(this.value=='Order id'){this.clear()}"{/literal}>
        </div>        
        <button  style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer;" onClick="return checkform();">Search order</button>
    
        
        </form>  
    </div>
    
    <div id='rightContainer' style='width:562px;'>
    	{if $order}
           {if $order->purchase_type ==0}
           {include file='ordermanager/_orders/_individualOrder.tpl}
           {else}
           {include file='ordermanager/_orders/_promotionUsedOrder.tpl}
           {/if}
        {else}
       <p> Please enter your order id inorder for us to retrieve your information. Contact information such as Email address and phone numbers will not be displayed.<br />
 </p>
        {/if}
    </div>

</div>
{include file="layouts/$layout/footer.tpl"}