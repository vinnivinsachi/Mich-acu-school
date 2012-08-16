{include file="layouts/$layout/header.tpl" lightbox=true}
<div id="banner" style="background-image:url('/public/resources/css/images/VEdanceHome2.jpg');">
 
 	<div id="bannerText" style="width:300px; height:400px; float:right;" >
    
    <div style="float:right; z-index:20; width:250px; height:400px; padding-left:25px; padding-right:25px; position:relative;">
    <div class='box' style="margin-top:15px;">
   
        <h2 style="margin-top:5px; margin-bottom:5px; float:left;">
   			We appreciate your feedback on your order. </h2>

		<form method="post" action="{geturl controller='index' action='orderreview'}" id="registration-form">	
            
            <div class="row" id="form_order_id_container">
                <input id='order_id' type=text name="order_unique_id" style="height:30px; width:145px;" style="color:#cccccc;" value="{if $fp->order_unique_id}{$fp->order_unique_id|escape}{else}Order id{/if}" onclick={literal}"if(this.value=='Order id'){this.clear()}"{/literal}>
                {include file='partials/error.tpl' error=$fp->getError('order_unique_id')}
            </div>    
            
            <div class="row" id="form_first_name_container">
                <textarea style="margin:0px;" rows="10" cols="27" name="order_review" value="{$fp->order_review|escape}" ></textarea>
                {include file='partials/error.tpl' error=$fp->getError('order_review')}

            </div>
            
            <button name="subscribe" style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer; float:left; width:150px;" >Submit review</button>
        
        </form>
    </div>
        
    </div>
    
        <div style="width:300px; height:400px; float:left; z-index:0; background:white; opacity:0.8; margin-top:-400px; position:relative;">
        </div>
    
    </div>

</div>





{include file="layouts/$layout/footer.tpl"}