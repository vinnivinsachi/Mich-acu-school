<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<title>VEdance - Men&acute;s Latin dance pants &amp; ballroom dance pants</title>
<meta name="keywords" content="VEdance, VE, dance, men's latin dance pants, latin pants, dance pants, men's dance pants, VEdance men's dance pants, VEdance, VE pants, men's ballroom dance pants, men's ballroom pants, competition dance pants, competition pants, ballroom/latin dance pants, ballroom/latin competition dance pants"/>
<meta name="description" content="VEdance is dedicated to providing quality ballroom pants and latin dance pants for men for competitive and social dancing."/>

<link rel="stylesheet" type="text/css" href="/public/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="/public/resources/css/vedance.css"/>
<link rel="stylesheet" type="text/css" href="/public/resources/css/slidemenu.css" />
<script src="/public/resources/javascripts/prototype.js" type="text/javascript"></script>
<script src="/public/resources/javascripts/scriptaculous/scriptaculous.js?load=effects,builder,dragdrop" type="text/javascript"></script>
<script src="/public/resources/global.js" type="text/javascript"></script>
<script src="/public/resources/jquery/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="/public/resources/jquery/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href="/public/resources/jquery/js/colorbox/colorbox.css" />
<script src="/public/resources/jquery/js/jquery.tools.min.js" type="text/javascript"></script>
<script>
     var $j = jQuery.noConflict();
</script>

<script src="/public/resources/jquery/js/jquery-ui-1.8.4.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="/public/resources/jquery/css/black-tie/jquery-ui-1.8.4.custom.css"/>
<script src="/public/resources/javascripts/VEcompileJS.js"></script>

</head>

<body>
        <div style="z-index:-2; position: absolute; left: 0px; top: 0px;">
            <img src="/public/resources/css/images/images/Background2.jpg" width='100%'/>
        </div>
        
        <div id="scroller">
             <div id='wrapper'>
            
            <div id="contentDiv">
            <div id='header'>
                <div id='headerLogo' style="float:left; width:100%; margin-bottom:-20px; margin-top:-10px;">
                    <div style="float:left;  ">
                    <a href='/' style="float:left; position:relative; left:-36px;"><img src="/public/resources/css/images/VEpantsLogo4.png" height="150px"/></a>
                    </div>
                    
                    <div style="width:200px; float:right; position:relative; bottom:-72px; text-align:right;">
                    <a href="/shoppingcart"><img src="/public/resources/css/images/Shoppingbag.png" /></a> <a href="/shoppingcart" style="margin-bottom:-10px;">Cart ( <span style='color:white;'>{$shoppingCartInfo->totalItems}</span> )</a> 
                    </div>
                </div>
                <div id="headerMenu">
                    <a id="homeMenuButton" class="{if $mainHeader=='HOME'}active{/if}" href="/"></a>
                    <a id="productMenuButton" class="{if $mainHeader=='PRODUCT'}active{/if}" href="{geturl controller='products'}"></a>
                    <a id="contactMenuButton" class="{if $mainHeader=='CONTACT'}active{/if}"></a>
                </div>
            </div>
           
            {if $messages|@count>0}

            <div id="messages" class="ui-widget">
                <div class="ui-state-highlight ui-corner-all" style="padding: 0pt 0.7em;"> 
                    <p>
                        <span class="ui-icon ui-icon-info" style="float: left; margin-right: 0.3em;"></span>	
                        {if $messages|@count==1}
                            <strong></strong>
                            {$messages.0}
                        {else}
                            <strong></strong>
                            <ul>
                                {foreach from=$messages item=row}
                                    <li>{$row}</li>
                                {/foreach}
                            </ul>
                        {/if}
                    </p>
                </div>
            </div>
            {else}
                <div id="messages" class="ui-widget" style="display:none"></div>
            {/if}

            