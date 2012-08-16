{include file="layouts/$layout/header.tpl" lightbox=true}


<div id="bottomBody" style="background-color:#f3f3f3; width:898px;">
	{include file='orderadministration/_leftContainer/_leftContainer.tpl}
    
    <div id='rightContainer' style='width:562px;'>
    	{if $order}
        	<table style="width:100%;">

                <tr style="background: #333333; color:white; padding:10px;">
                    <td colspan="3"  style="padding:4px;">Order Notes:</td>
                </tr>
                
                {foreach from=$notes item=note}
                <tr>
                	<td>
                		{$note.notes}
                    </td>
                    <td>
                    	{$note.ts_created}
                    </td>
                    <td>
                    	<form method='post' action="{geturl controller='orderadministration' action='deletenotes'}">
                    	<input type="submit" value="Delete"/>
                        <input type="hidden" name="id" value="{$note.order_profile_simple_notes_id}"/>
                        </form>
                    </td>
                </tr>
                
                {/foreach}
            </table>
           {if $order->purchase_type ==0}
           {include file='orderadministration/_orders/_individualOrder.tpl}
           {else}
           {include file='orderadministration/_orders/_promotionUsedOrder.tpl}
           {/if}
        {else}
       <p> Please enter your order id inorder for us to retrieve your information. Contact information such as Email address and phone numbers will not be displayed.<br />
 </p>
        {/if}
    </div>

</div>
{include file="layouts/$layout/footer.tpl"}