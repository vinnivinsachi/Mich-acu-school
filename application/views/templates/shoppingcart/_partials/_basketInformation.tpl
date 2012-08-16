<div id="basketInformation" style=' color:#666;'>
			<div id="productOrderTopTile" class='box'>
				<table class='box marginTop10' >
					<tr class='trTitle'><td>PRODUCT</td>
					<td style='text-align:center;'>DETAILS</td>
					<td style='text-align: right;'>PRICE</td>
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
		                
		                <td style='text-align: right; width:50px;'>
		                <a href="{geturl controller='shoppingcart' action='removeitemsfromshoppingcart'}?cartProductId={$cartKey}"><img src="/public/resources/css/images/Crosses.png" style="margin-bottom:-10px;"/></a>
		                </td>
					</tr>
					{/foreach}
                    
                   
                    <tr>
                    <td colspan="2">Cart Cost:</td>
                    <td style='text-align: right;'>${$shoppingCartInfo->tempTotalCost}</td>
                    </tr>
                    
                    <tr id='promotionInformation'>
                    <td colspan="3">
                    <table width="100%;">
                    {if $shoppingCartInfo->promotionCodeUsed!=''}
                    
                    <tr>
                    <td colspan="2">Promotion used: "{$shoppingCartInfo->promotionCodeUsed}" </td>
                    <td style='text-align: right; color:#ED1C4E;'>&shy;${$shoppingCartInfo->promotionAmountDeducted}</td>
                    </tr>
                    {/if}
                    
                    
                   
                    {if $shoppingCartInfo->totalCost!=0 || ($shoppingCartInfo->totalCost==0 and $shoppingCartInfo->promotionAmountDeducted!=0)}
                    <tr>
                    <td colspan="2" style="font-weight:bold; font-size:1.2em;">Cost before shipping:</td>
                    <td style='text-align: right; font-weight:bold; font-size:1.2em;'>${$shoppingCartInfo->totalCost}</td>
                    </tr>
                    {/if}
                    
                    {if $shoppingCartInfo->promotionQuote!=''}
                    <tr>
                        <td style='background:#333; color:white;' colspan='3'>
                        	
                        {$shoppingCartInfo->promotionQuote}
                        </td>
                        
                    </tr>
                    {/if}
                    
                    </table>
                    </td>
                    </tr>
				</table>
			</div>
            
            <div class="promotionSection" style="padding-top:20px; float:left; width:100%;">
            
            	<form method='post' action="{geturl controller='shoppingcart' action='applypromotion'}" id="promotionForm">
            	<div>
                <label>Promotion Code:</label><br/>
                <input type="text" name="code"/>				
                <input type="submit" value="recalculate cart" />

                {include file='partials/error.tpl'}   
                </div>
                </form>
                
            </div>
            
            {literal}
            <script type="text/javascript">
			new formEnhancerPromotion('promotionForm');
			</script>
            {/literal}
</div>
        