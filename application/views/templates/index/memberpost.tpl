{include file="layouts/$layout/header.tpl" lightbox=true}
 <div id='productTagBody' class='box' style="width:100%;">


	<div class='tooltip' style='width:600px; height:400px; background-color:white; border:1px solid #eee; z-index:10;'>
				<!-- now comes the partials -->
					<div class='box' style='width:300px; height:100%;'>
						<table>
		         		<tr style='height:350px;'><td style='padding:0px; margin:0px; width:300px;'>
		         		<div class="productFirstImage">
		                	<div class="productDescription">
		                       
		                    </div>
		                	{if $blog->images|@count>0}
		                	<img src="/public/resources/userdata/tmp/thumbnails/{$blog->images[0].username}/blogposts/{$blog->images[0].image_id}.W250_productDetailImage.jpg"/>
		                	{else}
		                        No image
		                    {/if}
		                </div>
		         		
		         		</td></tr>
		                
		               </table>
		                <div class="productDetails box">
	                    <div class="productMedia">
	                        <div class="productImages">
	                            {foreach from=$blog->images item=image}
	                                <div class="productIndividualImage">
	                                <img src="{$siteRoot}/public/resources/userdata/tmp/thumbnails/{$image.username}/blogposts/{$image.image_id}.W50_productSmallPreview.jpg" />
	                                <span class="imageLargeAddress" style="display:none">
	                                <img src="{$siteRoot}/public/resources/userdata/tmp/thumbnails/{$image.username}/blogposts/{$image.image_id}.W250_productDetailImage.jpg"/></span>					
	                                </div>
	                            {/foreach}
	                            
	                        </div>
	                    </div>
						</div>
						
				</div>
				<div class='productProfiles' style='width:260px; float:right; text-align: left; padding:0px 10px 0px 30px; background-color:#eee; height:100%;'>
	           			{$blog->profile->content}
	                  	
						
	            </div>
             </div>
</div>
{literal}

<script src="/public/resources/javascripts/productPreview/productImagePreviews.js" type="text/javascript"></script>

<script type="text/javascript">
new productPreviewImage('productTagBody');
$j(".tooltipControl").tooltip({position: 'bottom center'});
$j('a.fullOrderDetailsColorBox').colorbox({width:'800', height:'100%'});
$j('a.videoColorBox').colorbox({width:'480', height:'385', iframe:true});
</script>
{/literal}                 
{include file="layouts/$layout/footer.tpl"} 