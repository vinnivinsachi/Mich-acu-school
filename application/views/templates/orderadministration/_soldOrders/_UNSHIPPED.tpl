<div class="productShippingBody">
	                        	<div class='orderStatus bigFont box' style='padding:5px 0px 5px 0px; background-color:#FFE877;'>
	                        	<div class="productSellerInfo" style="float:left; padding-left:10px; width:40%;">
	                           	Please make shipment by: {$product.product_warning_delivery_date|date_format:"%D"}
	                            </div>
	                            <div class='box' style='width:25%;'>
	                            Status: {$product.order_status}
	                            </div>
	                            <div class='productShippingInfo' style='float:left; width:30%; text-align:right; width:33%;'>Shipping: <span class='price'>${$product.current_shipping_rate}</span>
	                            </div>
	                        	</div>
	                        	
	                            
	                        </div>

<div class="trackingInfo" style="width:100%; float:left; padding:5px 0px 5px 0px;">
    <div class="trackingInfoDetails box" >
    {if $product.product_warning_delivery_date|date_format<$smarty.now|date_format && $product.product_latest_delivery_date|date_format > $smarty.now|date_format}
    	<span style="color:#F30; padding-left:10px;">This product is now past due. The buyer will be able to cancel this order and be refunded. If the order is cancelled, you will no longer be able to provide any tracking information.</span>
    {else}
        <span style="color:#F90; padding-left:10px;"> Please submit a tracking info! The buyer will be able to cancel this order if this order is not shipped before {$product.product_latest_delivery_date|date_format:"%D"}.</span>
    {/if}
    </div>
	<div class="trackingActions" style="width:50%; float:right;">
    </div>
</div>
    <div class="trackingStatusInfo" style="width:100%; float:left;">
    {if $product.product_latest_delivery_date|date_format<$smarty.now|date_format}
        <span style="color:#F30;">Please ship this order ASAP and submit a tracking info! Message this buyer to prevent any miscommunications. The buyer is now able to cancel this order and be refunded. Once the order is cancelled by the buyer, you will not be able to submit a tracking info and be paid.</span>
	{/if}
    </div>
    
    <div class="orderProductFormSection" style="width:100%; float:left;">
[<a class="anchorOrderMessageSeller" id="anchorID-DivIDmessageForm-{$order->order_unique_id}_{$product.order_profile_id}" >Message buyer: {$product.buyer_name}</a>]
                            
<div style="float:right;">[<a class="anchorTrackingForm" id="anchorID-DivIDtrackingForm-{$order->order_unique_id}_{$product.order_profile_id}">Submit tracking info</a>]</div>

    <div class="TrackingForm {$order->order_unique_id}_{$product.order_profile_id}" id="DivIDtrackingForm-{$order->order_unique_id}_{$product.order_profile_id}" style="width:100%; float:left; display:none;">
        <form method="post" action="{geturl controller='ordermanager' action='addtrackingtoproduct'}">
            <label style="width:50%;">Tracking #:</label>
            <input type="text" name="productTracking" value=""/><br />
            <label style="width:50%;">Tracking Carrier:</label>
            <select name="productCarrier">
                <option value="USPS">USPS</option>
                <option value="FEDEX">FEDEX</option>
                <option value="UPS">UPS</option>
            </select>
            <input type="hidden" name="productId" value="{$product.order_profile_id}" />
            <input type="submit" value="Add tracking info" />
        </form>
    </div>  
    
        {include file='ordermanager/_message.tpl'}
            
 </div>

