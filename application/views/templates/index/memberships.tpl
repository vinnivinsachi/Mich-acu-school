{include file="layouts/$layout/header.tpl" lightbox=true}


{include file='index/_partials/leftContainer.tpl'}

<div id="rightContainer" class="box">
                	 <div id='productTagBody' class='box' style="width:100%;">

    {foreach from=$availableTags item=tag key=tagKey}
		<div id="postTagID-{addunderscore phrase=$tag.tag}" class="postTagSections box {if $tagKey!=0 && $currentTag!=$tag}hidden{/if}">
           <div class="box" style="margin-bottom:15px;">

                <div class="post-header" style="float:left;">
                   {$tag.tag}
                </div>
                 {counter assign=pictureNumber start=1 skip=1}


                <div class="post-content" style="float:left;">
                    {foreach from=$posts item=post key=Tag}
                        {if $Tag==$tag.tag}
                            
                            {foreach from=$post item=postItem}
                            
                            
                             <div class='productBox2' style='float:left; width:100px; background:#eeeeee;padding:5px; margin-right:9px; margin-top:5px;'>
								<div class="postFirstImage" style="float:left; width:100px; height:150px; ">
                                	{if $authenticated}
                                        <a href="{geturl controller='blogmanager' action='edit'}?id={$postItem.post_id}" title='edit' style="float:right;z-index:10; margin-bottom: -24px; position:relative;">
                                            <img src="/public/resources/css/images/edit.png"/>
            
                                        </a>
                                    {/if}
                                    {if $postItem.images|@count>0}
                                    <img src="/public/resources/userdata/tmp/thumbnails/{$postItem.images.0.username}/blogposts/{$postItem.images.0.image_id}.W100_memberPostImage.jpg"/>
                                    {else}
                                        No image
                                    {/if}

                                </div>
                                
                                <div class="{if $pictureNumber%6==0 || $pictureNumber==5 || $pictureNumber%11==0 || $pictureNumber%17==0 || $pictureNumber%23==0}tooltipControlLast{else}tooltipControl{/if} box" style='cursor:pointer; width:90px; height:26px; padding:5px; text-align: center; background:white; font-size:10px;'>{$postItem.title}</div>
								{counter}
                            
                                <div class='tooltip' style='width:600px; height:400px; background-color:white; border:1px solid #eee; z-index:50;'>
                                    <!-- now comes the partials -->
                                        <div class='box' style='width:300px; height:100%;'>
                                            <table>
                                            <tr style='height:350px;'><td style='padding:0px; margin:0px; width:300px;'>
                                            <div class="productFirstImage">
                                                <div class="productDescription">
                                                   
                                                </div>
                                                {if $postItem.images|@count>0}
                                                <img src="/public/resources/userdata/tmp/thumbnails/{$postItem.images.0.username}/blogposts/{$postItem.images.0.image_id}.W250_productDetailImage.jpg"/>
                                                {else}
                                                    No image
                                                {/if}
                                            </div>
                                            
                                            </td></tr>
                                            
                                           </table>
                                            <div class="productDetails box">
                                            <div class="productMedia">
                                                <div class="productImages">
                                                    {foreach from=$postItem.images item=image}
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
                                    <div class='productProfiles' style='width:260px; float:right; text-align: left; padding:0px 10px 0px 30px; background-color:#eee; height:100%; overflow-y:scroll'>
                                            {$postItem.content}
                                            
                                            
                                    </div>
                                 </div>
                             
                             </div>
                            {/foreach}
                        {/if}
                    {/foreach}
                    
                </div>
            </div>
        </div>
	{/foreach}
    </div>
</div>

{literal}

<script src="/public/resources/javascripts/productPreview/productImagePreviews.js" type="text/javascript"></script>

<script type="text/javascript">
new productPreviewImage('productTagBody');
$j(".tooltipControl").tooltip({position: 'top center'});
$j(".tooltipControlLast").tooltip({position: 'top left'});
$j('a.fullOrderDetailsColorBox').colorbox({width:'800', height:'100%'});
$j('a.videoColorBox').colorbox({width:'480', height:'385', iframe:true});
</script>
{/literal}    
{include file="layouts/$layout/footer.tpl"} 