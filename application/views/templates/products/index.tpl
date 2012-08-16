{include file="layouts/$layout/header.tpl" lightbox=true}
 <div id="banner" >
       <img src="/public/resources/css/images/Productbanner 4.jpg"/>
 </div>
<div id="bottomBody">
<div id="leftContainer" style="width:250px;">
            <div class='box' style="margin-top:15px;">
            {literal}
            
            <script language="Javascript" type="text/javascript">
            
            function checkform() {
              for (i=0;i<fieldstocheck.length;i++) {
                if (eval("document.subscribeform.elements['"+fieldstocheck[i]+"'].type") == "checkbox") {
                  if (document.subscribeform.elements[fieldstocheck[i]].checked) {
                  } else {
                    alert("Please enter your "+fieldnames[i]);
                    eval("document.subscribeform.elements['"+fieldstocheck[i]+"'].focus()");
                    return false;
                  }
                }
                else {
                  if (eval("document.subscribeform.elements['"+fieldstocheck[i]+"'].value") == "") {
                    alert("Please enter your "+fieldnames[i]);
                    eval("document.subscribeform.elements['"+fieldstocheck[i]+"'].focus()");
                    return false;
                  }
                }
              }
              for (i=0;i<groupstocheck.length;i++) {
                if (!checkGroup(groupstocheck[i],groupnames[i])) {
                  return false;
                }
              }
              
              return true;
            }
            
            var fieldstocheck = new Array();
            var fieldnames = new Array();
            function addFieldToCheck(value,name) {
              fieldstocheck[fieldstocheck.length] = value;
              fieldnames[fieldnames.length] = name;
            }
            var groupstocheck = new Array();
            var groupnames = new Array();
            function addGroupToCheck(value,name) {
              groupstocheck[groupstocheck.length] = value;
              groupnames[groupnames.length] = name;
            }
            
            function compareEmail()
            {
              return (document.subscribeform.elements["email"].value == document.subscribeform.elements["emailconfirm"].value);
            }
            function checkGroup(name,value) {
              option = -1;
              for (i=0;i<document.subscribeform.elements[name].length;i++) {
                if (document.subscribeform.elements[name][i].checked) {
                  option = i;
                }
              }
              if (option == -1) {
                alert ("Please enter your "+value);
                return false;
              }
              return true;
            }
            
            </script>
            {/literal}
            <form method=post name="subscribeform" action="/lists/?p=subscribe&id=5" style="float:left; width:100%;">
                <div class="attributeinput" style="width:145px; float:left;">
                <input type=text name=email style="height:30px; width:145px;" value="Your email" style="color:#cccccc;" onclick={literal}"if(this.value=='Your email'){this.clear()}"{/literal}>
                <script language="Javascript" type="text/javascript">addFieldToCheck("email","Email");</script>
                </div>
                <input type=hidden name="htmlemail" value="1">
                <input type="hidden" name="list[1]" value="signup"><input type="hidden" name="listname[1]" value="test"/>
                <div style="display:none"><input type="text" name="VerificationCodeX" value="" size="20"></div>
                
                <button name="subscribe" style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer;" onClick="return checkform();">Join email list</button>
            
                
            </form>
            
        <h1 style="margin-top:20px;">
        WHAT&acute;S NEW
        </h1>
        
        <!--<h2 style="margin-top:20px;">
        December 14th, 2010
        
        </h2>
        <span style="font-size:10px;">
        Today, we celebrate the launch of our new website here at VEdance.com. We are still in the process of making some more minor changes, but the site is fully functional. Feel free to check out our selection!
        </span>-->
        
        <h2 style="margin-top:60px;">
        Looking for high end dance shoes?
        </h2>
        <span style="font-size:10px;">
        <a target="_blank" href="http://www.professionalballroomshoes.com" title="Professional ballroom dancing shoes, best dance shoes"><img src="http://www.professionalballroomshoes.com/data/images/professional%20ballroom%20shoes%20logo_02.gif" width="250px" /></a>
        <a target="_blank" href="http://www.professionalballroomshoes.com" title="dancing shoes, ballroom dance shoes" style="font-size:10px;">www.professionalballroomshoes.com</a>
        </span>
        
        
        <h2 style="margin-top:60px;">
        Enviromental commitment</h2>
        <span style="font-size:10px;">
        Our pants come packaged in uniquely designed boxes made from up to 70% Post-Consumer  recycled content!
        </span>
    
        
     </div>
</div>

<div id='rightContainer' style='width:562px;'>
<h2 class='italic' style="margin-top: 30px; font-size:22px; padding-left:22px;">"What Dance Makeup is to women, Dance Pants are to men."</h2>

<div id="secondHeader" style="width:500px; padding-left:35px;">
	<a id="productClassic" class="tabButton {if $secondHeader=='productClassic'}active{/if}" ></a>
    <a id="productExecutive" class="tabButton {if $secondHeader=='productExecutive'}active{/if}" ></a>
    <a id="productSienna" class="tabButton {if $secondHeader=='productSienna'}active{/if}"></a>
    <a id="productPrince" class="tabButton {if $secondHeader=='productPrince'}active{/if}"></a>
</div>
<div id="secondHeaderContent" style=""><br />
	<div id="productClassicContent" class="tabContent box">
    	<div id='productDetail1LeftColumn' class='box' style=''>

    	{include file='products/_partials/_productTopDetails.tpl product=$products.1}
		</div>
       
        {literal}
        <script type="text/javascript">
        new productPreviewImage('productDetail1LeftColumn');
        
        </script>
        {/literal}
    
		{include file='products/_partials/_productBottomDetails.tpl product=$products.1}
        
      
    </div>
    <div id="productExecutiveContent" class="tabContent box" style='display:none;'>
		<div id='productDetail2LeftColumn' class='box' style=''>

    	{include file='products/_partials/_productTopDetails.tpl product=$products.2}
		</div>
        

        {literal}
        <script type="text/javascript">
        new productPreviewImage('productDetail2LeftColumn');
        /*new formEnhancerShoutoutMessage('shoutbox-form');
        new formEnhancerPrivateMessage('privateMessage-form');*/
        </script>
        {/literal}
    
		{include file='products/_partials/_productBottomDetails.tpl product=$products.2}
                   

        
    </div>
    <div id="productSiennaContent" class="tabContent" style='display:none;'>
		<div id='productDetail4LeftColumn' class='box' style=''>

    	{include file='products/_partials/_productTopDetails.tpl product=$products.4}
		</div>
        

        {literal}
        <script type="text/javascript">
        new productPreviewImage('productDetail4LeftColumn');
        /*new formEnhancerShoutoutMessage('shoutbox-form');
        new formEnhancerPrivateMessage('privateMessage-form');*/
        </script>
        {/literal}
    
		{include file='products/_partials/_productBottomDetails.tpl product=$products.4}
    </div>
    <div id="productPrinceContent" class="tabContent" style='display:none;'>
		<div id='productDetail5LeftColumn' class='box' style=''>

		{include file='products/_partials/_productTopDetails.tpl product=$products.5}
		</div>
        

        {literal}
        <script type="text/javascript">
        new productPreviewImage('productDetail5LeftColumn');
        /*new formEnhancerShoutoutMessage('shoutbox-form');
        new formEnhancerPrivateMessage('privateMessage-form');*/
        </script>
        {/literal}
    
		{include file='products/_partials/_productBottomDetails.tpl product=$products.5}
    </div>

</div>

</div>
 
{literal}
<script type="text/javascript">
new secondHeaderButtonToggle('.tabButton', '.tabContent');
</script>
{/literal}
{include file="layouts/$layout/footer.tpl"}