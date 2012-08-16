{include file="layouts/$layout/header.tpl" lightbox=true}

<table class="shoppingcart">
	<tr>
    	<td>Order Id</td>
        <td>Order unique id</td>
        <td>buyer</td>
        <td>purchase type</td>
        <td># items</td>
        <td>total costs</td>
        <td>ordered on</td>
        <td>status</td>
    </tr>
    
    {foreach from=$orders item=order}
    <tr>
    	<td>{$order.order_id}</a></td>
        <td><a href="{geturl controller='orderadministration' action='details'}?id={$order.order_unique_id}">{$order.order_unique_id}</a></td>
        <td>{$order.buyer_name}</td>
        <td>{$order.purchase_type}</td>
        <td>{$order.total_number_items}</td>
        <td>{$order.cart_costs}</td>
        <td>{$order.ts_created}</td>
        <td>{$order.status}</td>
    
    </tr>
    {/foreach}

</table>


{include file="layouts/$layout/footer.tpl"}