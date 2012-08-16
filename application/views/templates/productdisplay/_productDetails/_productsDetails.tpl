<div id='page' class='box' style="">
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
<div id="productDetailRightSidePanel" class='box' style='float:right; width: 410px; padding-right:10px;'>
	<div class='box marginTop20' style='width:410px;'>	<div class='titleBarBig'>{$product.0.name}<span style='float:right;'>{$product.0.product_tag}</span></div>
	</div>
     <div class="productProfiles box marginTop20" style='text-align: left; width:100%;'>
    	<form method='post' action="{geturl controller='shoppingcart' action='additemtoshoppingcart'}">
    	<input type='hidden' name='attribute[brand]' value='{$product.0.brand}'/>
    	
        {assign var='orderAttribute' value=$product.0.inventory_attribute_table}
		{include file="productdisplay/_productCustomizableAttribute/_$orderAttribute.tpl" product=$product}
		
        <div style="float:left; width:100%; padding:20px 0px 20px 0px;">
  			{if $product.discount_price=='' || $product.discount_price==0}
                  <div class="discountBoxPrice" style="width:50%; float:left;">
                     ${$product.0.price}
                  </div>
                 {elseif $product.discount_price>0}
                  <div class="productBoxPrice">
                      ${$product.0.price}
                   </div>

               <div class="discountBoxPrice">
                ${$product.0.discount_price}
               </div>
            {/if}
            
            <div class='quickOrderActions' style='float:left; width:50%;'>
                <input type='submit' style='float:left; padding:10px;' value='Add to cart'/>
            </div>
        </div>
	 	<input type='hidden' name='product' value='Customize'/>
	 	<input type='hidden' name='id' value='{$product.0.product_id}'/>
  		</form>
    </div>
	<div class='productDetailTop box'>
	<div class='titleBarMid'>Description </div>
	<div class='box' style='padding:10px; width:390px; font-size:13pt;'>{$product.profile.0.profile_value}</div>
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