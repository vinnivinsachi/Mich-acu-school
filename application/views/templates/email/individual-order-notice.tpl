*****ORDER notice from VEdance LLC*****<br /><br />
Thank you for your order. Here are the details of the order that was placed on {$order->ts_created|date_format}<br />


<table>

	<tr style="background: #333333; color:white; padding:10px;">
    	<td colspan="2"  style="padding:4px;">Buyer Information</td>
    </tr>
    <tr>
    	<td>Buyer name: </td>
        <td>{$order->buyer_name} </td>
	</tr>
    <tr>
    	<td>Buyer Email:</td>
        <td>{$order->buyer_email}</td>
    </tr>
    <tr>
    	<td>Buyer phone number:</td>
        <td>{$order->buyer_phone_number}</td>
    </tr>
    <tr>
    	<td>Buyer shipping address:</td>
        <td>{$order->buyer_address}<br />
{$order->buyer_city} {$order->buyer_state}, {$order->buyer_zip}<br />
{$order->buyer_country}</td>
	</tr>


	<tr style="background: #333333; color:white;">
		<td colspan="2"  style="padding:10px; padding:10px; font-size:1.2em; font-weight:bold;">Order Information</td>
    </tr>
    <tr>
    	<td>Ordered on:</td>
        <td>{$order->ts_created|date_format}</td>
    </tr>
    <tr>
    	<td>Invoice ID: </td>
        <td>{$order->order_unique_id}</td>
    </tr>
    <tr>
    	<td>Check your order status at: </td>
        <td>http://www.vedance.com/ordermanager/guestorders?id={$order->order_unique_id}</td>
    </tr>
    

	<tr style="background: #333333; color:white;">
		<td colspan="2"  style="padding:4px;">Product information</td>
	</tr>
    {foreach from=$products item=profile}	
    
    <tr>
        <td>{$profile.product_name}</td>
        <td>$ {$profile.product_price}</td>
    </tr>
    
    {/foreach}

	<tr style="background: #333333; color:white;">
		<td colspan="2" style="padding:4px;">Cost information</td>
	</tr>
			
	<tr>
        <td>Total:</td>
        <td>$ {$order->cart_costs}</td>
	</tr>
   
	<tr>
        <td>PromotionCode:</td>
        <td># {$order->promotion_code_used}</td>
    </tr>
    
    <tr>
        <td>Discount amount:</td>
        <td>${$order->promotion_amount_deducted} dollar</td>
    </tr>
    
    <tr>
        <td style="font-weight:bold;">Total after promotion:</td>
        <td style="font-weight:bold;">$ {$order->final_total_costs}</td>
    </tr>
</table>

	<br />

Sincerely,<br />

VEdance Administrator<br />