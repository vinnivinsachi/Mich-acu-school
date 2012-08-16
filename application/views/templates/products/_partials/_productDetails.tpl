<div id='productDetailLeftColumn' class='box' style='padding-left:5px; width:320px;'>
 	<div class="productBox2 box marginTop20" style="width:320px; height:100%;">
						<table>
		         		<tr style='height:350px; '><td style='padding:0px; margin:0px; width:320px;'>
		         		<div class="productFirstImage">
		                	<div class="productDescription">
		                       
		                    </div>
		                	{if $product.images|@count>0}
		                	<a class='colorBox' rel="{$product.0.name}" href="/public/resources/userdata/uploaded-files/{$product.0.uploader_username}/{$product.0.product_tag}/{$product.images[0].image_id}.jpg"><img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/{$product.0.product_tag}/{$product.images[0].image_id}.W300_productDetailImage.jpg"/></a>
		                	{else}
		                        No image
		                    {/if}
		                </div>
		         		
		         		</td></tr>
		                
		               </table>
		                <div class="productDetails box">
	                    <div class="productMedia">
	                        <div class="productImages">
	                            {foreach from=$product.images item=image}
	                                <div class="productIndividualImage">
	                                <img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/{$product.0.product_tag}/{$image.image_id}.W50_productSmallPreview.jpg" />
	                                <span class="imageLargeAddress" style="display:none">
	                                <a class='colorBox' rel="{$product.0.name}" href="/public/resources/userdata/uploaded-files/{$product.0.uploader_username}/{$product.0.product_tag}/{$image.image_id}.jpg"><img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/{$product.0.product_tag}/{$image.image_id}.W300_productDetailImage.jpg"/></a>
                                    </span>					
	                                </div>
	                            {/foreach}
	                            {foreach from=$product.inventoryImages item=inventoryImage}
	                            	<div class="productIndividualImage">
	                                <img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/inventory/{$inventoryImage.image_id}.W50_productSmallPreview.jpg" />
	                                <span class="imageLargeAddress" style="display:none">
	                                <a class='colorBox' rel="{$product.0.name}" href="/public/resources/userdata/uploaded-files/{$product.0.uploader_username}/{$product.0.product_tag}/{$inventoryImage.image_id}.jpg"><img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/inventory/{$inventoryImage.image_id}.W300_productDetailImage.jpg"/></a></span>					
	                                </div>
	                            {/foreach}
	                        </div>
	                    </div>
						</div>
						
	</div>
	<div class='box marginTop20'>
		<div class='titleBarBig' style="height:30px;">
			Shipping
		</div>
		<div class='box' style='width:310px; padding-left:10px;'>
			<div id='shippingInfo'>
			<div class='box' style='padding-top:10px;'>
			 <label>Domestic shipping:</label>
			 ${$product.0.domestic_shipping_rate}
			</div>
			<div class='box' style='padding-top:10px;'>
			 <label>International shipping:</label>
			 ${$product.0.international_shipping_rate}
			</div></div>
			<div id='returnsAndServiceFee'></div>
		</div>
	</div>
    
    <div class='box marginTop20'>
		<div class='titleBarBig' style="height:30px;">
			Reviews
		</div>
		<div class='box' style='width:310px; padding-left:10px;'>
			
		</div>
	</div>
</div>
   
    

{literal}
<script type="text/javascript">
new productPreviewImage('productDetailLeftColumn');
/*new formEnhancerShoutoutMessage('shoutbox-form');
new formEnhancerPrivateMessage('privateMessage-form');*/
</script>
{/literal}