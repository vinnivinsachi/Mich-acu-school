<p>Tracking status: {if $order->tracking}{$order->tracking}{else}Tracking not submitted{/if}</p>

<p> *****ORDER notice from VEdance LLC*****<br /><br />
        Thank you for your order. Here are the details of the order that was placed on {$order->ts_created|date_format}<br />
        The promotion code: # {$order->promotion_code_used} was used for this order.<br />
        This order will be shipped to our promotion code linked partner organization {$order->partner_organization_name} address:<br /><br /></p>
        <table>
            <tr style="background: #333333; color:white;">
                <td colspan="2" style="padding:4px;">Promotion Linked Partner Organziation/Reseller</td>
            </tr>
            <tr>
                <td>Name of organization:</td> 
                <td>{$order->partner_organization_name}</td>
            </tr>
            <tr>
                <td>Primary contact: </td>
                <td>{$order->partner_organization_primary_contact}</td>
            </tr>
            <tr>
                <td>Contact Email:</td>
                <td>XXX@XXXX.com</td>
            </tr>
            <tr>
                <td>Contact phone number:</td>
                <td> XXXXXXXXXX</td>
            </tr>
            <tr>
                <td>Primary address:</td>
                <td>XXXXXXXXXX
                </td>
            </tr>
            <tr>
                <td colspan="2">*****Please contact the buyer when shippment arrives*****</td>
            </tr>
        
            <tr style="background: #333333; color:white; padding:10px;">
                <td colspan="2"  style="padding:4px;">Buyer Information</td>
            </tr>
            <tr>
    		<td>Buyer name: </td>
                <td>{$order->buyer_name} </td>
            </tr>
            <tr>
                <td>Buyer Email:</td>
                <td>XXX@XXXX.com</td>
            </tr>
            <tr>
                <td>Buyer phone number:</td>
                <td>XXXXXXXXXX</td>
            </tr>
            <tr>
                <td>Buyer shipping address:</td>
                <td>XXXXXXXXXX</td>
            </tr>
            <tr>
                <td colspan="2">
                *****Please keep in contact with the organziation above inregards to this order*****
                </td>
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
                <td>http://www.vedance.com/ordermanager/guestorders?ID={$order->order_unique_id}</td>
            </tr>
            
        
            <tr style="background: #333333; color:white;">
                <td colspan="2"  style="padding:4px;">Product information</td>
            </tr>
            {foreach from=$order->products item=profile}	
            
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