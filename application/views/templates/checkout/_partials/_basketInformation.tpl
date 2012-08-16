<div id="basketInformation" style='font-size:14pt;'>
			<div id="productOrderTopTile" class='box'>
				<table class='box marginTop10' >
					<tr class='trTitle'><td>PRODUCT</td>
					<td style='text-align:center;'>DETAILS</td>
					<td style='text-align: right;'>PRICE</td>
					<td style='text-align: right; width:150px;'>REWARD POINTS</td>
					<td style='text-align: right;'></td></tr>
					
					{foreach from=$shoppingCartProducts item=product key=cartKey}
					<tr><td><br/><strong>{$product.product_name}</strong><br/><img src='/public/resources/userdata/tmp/thumbnails/{$product.uploader_username}/{$product.product_tag}/{$product.product_image_id}.W150_homeFrontFour.jpg'/></td>
						<td ><table width="100%;">
							{foreach from=$product.attributes item=attributes key=Key}
                            	{if $Key!='brand'}
	                            <tr>
	                            <td style='text-align:right; width:60%;'>{removeunderscore phrase=$Key}: </td>
	                            <td style='text-align:left; width:40%;'>{removeunderscore phrase=$attributes}</td>
	                            </tr>
                                {/if}
                            {/foreach}
                            </table>
		                </td>
		                <td style='text-align: right;' class='price'>
							${$product.product_price}
		                </td>
		                <td style='text-align: right; width:100px;'>
							+ {$product.reward_points_awarded} points
		                </td>
		                <td style='text-align: right; width:50px;'>
		                <a href="{geturl controller='shoppingcart' action='removeitemsfromshoppingcart'}?cartProductId={$cartKey}"><img src="/public/resources/css/images/Crosses.png" style="margin-bottom:-10px;"/></a>
		                </td>
					</tr>
					{/foreach}
				</table>
			</div>
</div>
        