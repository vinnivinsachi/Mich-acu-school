<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Chinese Acupressure Massage School and Chinese Acupuncture Master School</title>
<meta name="keywords" content="Michigan Acupuncture, Michigan acupressure massage, acupuncture masters school, acupressure massage."/>
<meta name="description" content="Michigan-Acupuncture is the dedicated to provide the best acupressure massage service in Michigan as well as offering a acupuncture masters school."/>


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
{literal}
<!--[if ie]> 
<style type="text/css">
#headerMenu a{
	font-size:14px;
}
</style>

<![endif]-->
{/literal}
</head>

<body>
        <div style="z-index:-2; position: absolute; left: 0px; top: 0px; width:100%;">
            <img src="/public/resources/css/images/Background.jpg" width='100%'/>
        </div>
        
        <div id="scroller">
             <div id='wrapper'>
            
            <div id="contentDiv">
            <div id='header' style="float:left;">
            
                <div id='headerLogo' style="width:100%;">
                	
                    	<a href='/' style='display: inline-block; height:80px; font-size:36px;'><span style='float: left; padding-top: 30px;'>Acu Clinic</span></a>
                    
                   
                </div>
                <div id="headerMenu">
                	{if $currentLanguage=='EN'}	
                   <a href="{geturl controller='index'}?category=About Us">About Us</a>
                   <a href="{geturl controller='index'}?category=Prices">Prices</a>
                   <a href="{geturl controller='index'}?category=News and Events">News and Events</a>
                   <a href="{geturl controller='index'}?category=Special Offers">Special Offers</a>
                   <a href="{geturl controller='index'}?category=Lectures">Lectures</a>
                   <a href="{geturl controller='index'}?category=Location">Location</a>
                   <a href="{geturl controller='index'}?category=Contact Us">Contact Us</a>

                   {elseif $currentLanguage=='CH'}
                   <a href="{geturl controller='index'}?category=Acupuncture Master School" style="margin-right:60px;">�������Ĵ�ʦѧУ</a>
                   <a href="{geturl controller='index'}?category=Services" style="margin-right:60px;">����</a>
                   <a href="{geturl controller='index'}?category=Online Classes" style="margin-right:60px;">����</a>
                   <a href="{geturl controller='index'}?category=News and Events" style="margin-right:60px;">���źͻ</a>
                   <a href="{geturl controller='index'}?category=Memberships" style="margin-right:60px;">��Ա</a>
                   <a href="{geturl controller='index'}?category=Testimonials" style="margin-right:60px;">��л��</a>
                   <a href="{geturl controller='index'}?category=Tuition">ѧ��</a>
                   {/if}
                </div>
                
                <div id="headerContent" style="float:left; width:100%; ">
                	<div id="headerContactUS" style="float:left; width:250px; height:230px;">
                    	<p style="padding-left:25px;">Have a question?</p>
                        <form style="padding-left:25px;" method="post" action="{geturl controller='index' action='contactus'}">	


                            <div class="row" id="form_username_container">
                                <input id='form_username' class='headerInput' type=text name="first_name" style="height:30px; width:200px; margin-bottom:10px;"value="{if $fp->first_name}{$fp->first_name|escape}{else}First name{/if}" onclick={literal}"if(this.value=='First name'){this.clear()}"{/literal}>
                            </div>
                            
                        
                            
                            <div class="row" id="form_email_container">
                                <input type=text name="email"  class='headerInput' style="height:30px; width:200px; margin-bottom:10px;"  value="{if $fp->email}{$fp->email}{else}Your email{/if}" style="color:#cccccc;" onclick={literal}"if(this.value=='Your email'){this.clear()}"{/literal}>
                            </div>
                            
                            <div class="row" id="form_first_name_container">
                                <textarea style="margin:0px; width:200px; border:none;" mce_editable="false" class="headerInput" rows="2"  name="description" value="{$fp->description|escape}" >Message: </textarea>
                            </div>
                            
                            <button class='submit' style="margin-top:10px; float:right; margin-right:15px; padding-left:20px; padding-right:20px;" >Ask</button>
                        
                        </form>
                    </div>
                    <div id="headerBanner" style="float:left; width:750px; height:230px;">
                    	<div style="float:left; width:100%; padding-left:15px; position:relative; margin-bottom:-53px;">
                        	<a href="http://www.facebook.com/pages/Chinese-Acupressure-Massage-School/157560737613388?v=info"><img src="/public/resources/css/images/Web icons/facebook.png" /></a>
                            <a href="http://twitter.com/#!/michacu"><img src="/public/resources/css/images/Web icons/Twitter.png" /></a>
                            <a href="http://www.youtube.com/user/michiganacupuncture"><img src="/public/resources/css/images/Web icons/Youtube.png" /></a>
                        </div>
                    	<img src="/public/resources/css/images/michigan-acupuncture/acupuncture.png" style="float:left;"/>
                        
                        <div style='float:left; width:750px; height:50px; position:relative; margin-top:-60px;'>
                            <div style='float:left; width:750px; height:50px; padding-top:5px; padding-bottom:5px;background:white; opacity:0.3; z-index:1; filter:alpha(opacity=30) '>
                            </div>
                            
                            <!--<div id='headerSignUp' style='float:left; width:750px; margin-top:-50px; z-index:20; position:relative;'>
                                <p style="float:left; width:325px; margin:0px 0px 0px 0px; padding:0px 0px 0px 15px; color:white;">Sign up for a <strong style="font-size:18px;">FREE </strong>acupuncture/massage session</p>
                                <form style="float:right; margin-right:15px;" method="post" action="{geturl controller='index' action='newslettersignup'}">
                                    <input class='headerInput' name="signupEmail" value="Email:" onclick={literal}"if(this.value=='Email:'){this.clear()}"{/literal}"/>
                                    <button class='submit' >Sign me up</button>
                                </form>
                            </div> -->
                        </div>
                    </div>
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
            <div id="mainBodyContent" class='box' style='padding-top:10px;'>