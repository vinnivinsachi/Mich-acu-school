<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

<link rel="stylesheet" type="text/css" href="/public/resources/css/index.css"/>
<link rel="stylesheet" type="text/css" href="/public/resources/css/vedance.css"/>
<link rel="stylesheet" type="text/css" href="/public/resources/css/slidemenu.css" />
<script src="/public/resources/javascripts/prototype.js" type="text/javascript"></script>
<script src="/public/resources/javascripts/scriptaculous/scriptaculous.js?load=effects,builder" type="text/javascript"></script>
<script src="/public/resources/global.js" type="text/javascript"></script>
<script src="/public/resources/jquery/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script src="/public/resources/jquery/js/colorbox/jquery.colorbox-min.js" type="text/javascript"></script>
<link rel='stylesheet' type='text/css' href="/public/resources/jquery/js/colorbox/colorbox.css" />
<script src="/public/resources/jquery/js/jquery.tools.min.js" type="text/javascript"></script>
<script>
     var $j = jQuery.noConflict();
</script>

<script src="/public/resources/jquery/js/jquery-ui-1.8.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="/public/resources/jquery/css/start/jquery-start.custom.css"/>

<script type="text/javascript" src="/public/resources/javascripts/accountDetailEnhancement.js"></script>
<script type="text/javascript" src="/public/resources/javascripts/universalToggle.js"></script> 
<script type="text/javascript" src="/public/resources/javascripts/simpleToggle.js"></script>
<script type="text/javascript" src="/public/resources/javascripts/orderToggle.js"></script>
<script type="text/javascript" src="/public/resources/javascripts/adminOrderToggle.js"></script>
<script src="/public/resources/javascripts/formEnhancer/formEnhancer.js" type="text/javascript"></script>
<script src="/public/resources/javascripts/formEnhancer/checkOutEnhancer.js" type="text/javascript"></script>
<script src="/public/resources/javascripts/productPreview/productImagePreviews.js" type="text/javascript"></script>
<script src="/public/resources/javascripts/slidemenu.js" type="text/javascript"></script>
</head>

<body>
			
            
            {if $messages|@count>0}

            <div id="messages" class="ui-widget">
            	<div class="ui-state-highlight ui-corner-all">
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
            <div id='wrapper'>
{include file='partials/leftColumnIndex.tpl'}
			<div id="rightContainer" style="width:800px; float:left;">