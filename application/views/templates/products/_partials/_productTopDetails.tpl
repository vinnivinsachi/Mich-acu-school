 	<div class="productBox2 box" style="width:250px; height:100%;">
						<table>
		         		<tr style='height:350px; '><td style='padding:0px; margin:0px; width:250px;'>
		         		<div class="productFirstImage">
		                	<div class="productDescription">
		                       
		                    </div>
		                	{if $product.images|@count>0}
		                	<a class='colorBox' rel="{$product.0.name}" href="/public/resources/userdata/uploaded-files/{$product.0.uploader_username}/{$product.0.product_tag}/{$product.images[0].image_id}.jpg"><img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/{$product.0.product_tag}/{$product.images[0].image_id}.W250_productDetailImage.jpg"/></a>
		                	{else}
		                        No image
		                    {/if}
		                </div>
		         		
		         		</td></tr>
		                
		               </table>
		                <div class="productDetails box">
	                    <div class="productMedia" style="padding:0px 5px;">
	                        <div class="productImages">
	                            {foreach from=$product.images item=image}
	                                <div class="productIndividualImage">
	                                <img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/{$product.0.product_tag}/{$image.image_id}.W50_productSmallPreview.jpg" />
	                                <span class="imageLargeAddress" style="display:none">
	                                <a class='colorBox' rel="{$product.0.name}" href="/public/resources/userdata/uploaded-files/{$product.0.uploader_username}/{$product.0.product_tag}/{$image.image_id}.jpg"><img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/{$product.0.product_tag}/{$image.image_id}.W250_productDetailImage.jpg"/></a>
                                    </span>					
	                                </div>
	                            {/foreach}
	                            {foreach from=$product.inventoryImages item=inventoryImage}
	                            	<div class="productIndividualImage">
	                                <img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/inventory/{$inventoryImage.image_id}.W50_productSmallPreview.jpg" />
	                                <span class="imageLargeAddress" style="display:none">
	                                <a class='colorBox' rel="{$product.0.name}" href="/public/resources/userdata/uploaded-files/{$product.0.uploader_username}/{$product.0.product_tag}/{$inventoryImage.image_id}.jpg"><img src="/public/resources/userdata/tmp/thumbnails/{$product.0.uploader_username}/inventory/{$inventoryImage.image_id}.W250_productDetailImage.jpg"/></a></span>					
	                                </div>
	                            {/foreach}
	                        </div>
	                    </div>
						</div>
						
	</div>
    
    <div class="productLeftDetailRightContent" style='width:230px; float:right; padding-right:5px; font-size:14px;'>
    <div class='box' >	<div class='titleBarBig'>{$product.0.name}<span style='float:right;'>{$product.0.product_tag}</span></div>
	</div>
     <div class="productProfiles box marginTop20" style='text-align: left; width:230px; float:right;'>
    	<form method='post' action="{geturl controller='shoppingcart' action='additemtoshoppingcart'}">
    	<input type='hidden' name='attribute[brand]' value='{$product.0.brand}'/>
    	
        {assign var='orderAttribute' value=$product.0.inventory_attribute_table}
		{include file="products/_productCustomizableAttribute/_$orderAttribute.tpl" product=$product}
		
        <div style="float:left; width:100%; padding:20px 0px 20px 0px; font-size:40px;">
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
            
            <div class='quickOrderActions' style='float:right; width:50%; text-align:right;'>
                <input type='submit' style='padding:10px;' value='Add to cart'/>
            </div>
        </div>
	 	<input type='hidden' name='product' value='Customize'/>
	 	<input type='hidden' name='id' value='{$product.0.product_id}'/>
  		</form>
    </div>
    
    <div class='titleBarMid box' >Shipping information</div>
	<div class='box'>
			<div class='box' style='margin-top:5px;'>
			 <label style="float:left; width:auto;">Domestic shipping:</label>
			 <div style="float:right;">${$product.0.domestic_shipping_rate}</div>
			</div>
			<div class='box' style='margin-top:5px;'>
			 <label style="float:left; width:auto;">International shipping:</label>
			 <div style="float:right;">${$product.0.international_shipping_rate}</div>
			</div>
    </div>

    
  
   </div>
    