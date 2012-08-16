{foreach from=$itemsSold item=order key=Key}
            	<div class="orderMainDiv" id="orderMainDiv-{$order->order_unique_id}" style=" width:99%; float:left; margin-bottom:10px; color:#666">
                	<div class="orderHistoryTitle" style=" width:100%; float:left; font-weight:bold;">
                        <div class='box'><div class='titleBarMid'>Order id: {$order->order_unique_id}<span style="float:right; text-align:right;">Created time: {$order->ts_created|date_format:"%D, %I:%M %p"}</span>
                        </div></div>
                    </div>
                    <div class="orderDeliveryAddress" style="width:100%; float:right; font-weight:bold; padding-bottom:10px;">
                     	
                        <div class='box'>
                        Deliver to: <br/>{$order->buyer_name}<br />
                        {$order->shippingAddress->address_one}<br />
                        {if $order->shippingAddress->address_two!=''}
                            {$order->shippingAddress->address_two}<br />
                        {/if}
                        {$order->shippingAddress->city} {$order->shippingAddress->state}, {$order->shippingAddress->zip}<br />
                        {$order->shippingAddress->country}<br />
                        </div>
                    </div>
                    <table class='box'>
                    <tr class='trTitle' ><td style='padding-bottom:10px;'>Product</td>
                    <td style='padding-bottom:10px; text-align:center;'>Details</td>
                    <td style='padding-bottom:10px;'>Quantity</td>
                    <td style='padding-bottom:10px;'>Price</td>
                    </tr>
                    {foreach from=$order->products item=product key=productKey}
                    <tr>
                    	<td><span style="font-weight:bold;">{$product.product_name} <span style="font-weight:bold; {if $product.product_order_status=='shipped'}color:#069;{elseif $product.product_order_status=='return shipped' || $product.product_absolute_latest_delivery_date|date_format < $smarty.now|date_format}color:#F30;{elseif $product.product_order_status=='order completed' || $product.product_order_status=='order return completed'}color:#0C0;{else} color:#F90;{/if} font-size:12px; fon">{$product.product_order_status}</span></span>
                    		<br/>{$product.product_type_added_to_shopping_cart}<br/>
                    		<img src='/public/resources/userdata/tmp/thumbnails/{$product.uploader_username}/{$product.product_tag}/{$product.product_image_id}.W150_homeFrontFour.jpg'/>
						</td>     
						<td> 
							<table>
                            {foreach from=$product.profile item=attribute key=attributeKey}
                            <tr>
                            <td style='width:60%; text-align:right;'>{removeunderscore phrase=$attribute.profile_key}: </td>
                            <td style='width:40%; text-align:left;'>{removeunderscore phrase=$attribute.profile_value}</td>
                            </tr>
                            {/foreach}
                        	</table>
                        </td>
						<td>1</td>  
						<td class='price'>${$product.product_price}</td> 
                    </tr>
                    
                    <tr>
                    	<td colspan='4'>
                    	
                    	<div class="productMainDiv" style="width:100%; float:left; padding-top: 10px; border-bottom:1px solid #069; margin-bottom:5px; ">
                       
	                        
	                        
	                        
	                        {assign var='orderStatusTemplate' value=$product.order_status}
	                       	{include file="ordermanager/_soldOrders/_$orderStatusTemplate.tpl"}
                   	 	</div>
                    
                    </td>
                    
                    </tr>
                    
                    
                    {/foreach}
                   	</table>
                </div>
            {/foreach}