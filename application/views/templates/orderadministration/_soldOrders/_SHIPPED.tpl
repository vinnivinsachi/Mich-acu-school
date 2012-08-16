 <div class="productShippingBody">
	                        	<div class='orderStatus bigFont box' style='padding:5px 0px 5px 0px; background-color:#FFE877;'>
	                        	
	                            <div class='box' style='width:25%;'>
	                            Status: {$product.order_status}
	                            </div>                             <span style="font-size:12px;">Waiting for delivery</span>
	                            
	                            <div class='productShippingInfo' style='float:right; width:30%; text-align:right; width:33%;'>Shipping: <span class='price'>${$product.current_shipping_rate}</span>
	                            </div>
	                        	</div>
	                        	
	                            
	                        </div>
 
 <div class="trackingInfo" style="width:100%; float:left; padding:5px 0px 5px 0px;">
                            <div class="trackingInfoDetails" style="width:50%; float:left;">
                            Tracking: {$product.product_tracking}<br />
                            Carrier: {$product.product_tracking_carrier}<br />
							Date shipped: {$product.product_shipping_date|date_format:"%D"}
                            </div>
				<div class="trackingActions" style="width:50%; float:right;">
                            </div>
                        </div>
                        <div class="trackingStatusInfo">
                        
                        </div>
                        
    
    <div class="orderProductFormSection" style="width:100%; float:left;">
[<a class="anchorOrderMessageSeller" id="anchorID-DivIDmessageForm-{$order->order_unique_id}_{$product.order_profile_id}" >Message buyer: {$product.buyer_name}</a>]
                            
                            [<a class="anchorTrackingStatus" id="anchorID-DivIDtrackingStatusInfo-{$order->order_unique_id}_{$product.order_profile_id}" title="{$product.product_tracking}">Tracking status</a>]

                                  <div class="trackingStatusInfo {$order->order_unique_id}_{$product.order_profile_id}" id="DivIDtrackingStatusInfo-{$order->order_unique_id}_{$product.order_profile_id}" style="display:none;"></div>

        {include file='ordermanager/_message.tpl'}
            
 </div>

