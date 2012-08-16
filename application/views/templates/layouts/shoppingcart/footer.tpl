</div>

		<div id="footerImage" style="width:900px;">
        	<div style="float:left; width:250px;">
            <a href='/index/index' style="width:250px;"><img src="/public/resources/css/images/VEdance/VEBoxprintVerticalFooter_1.png" /></a>
            </div>
            {if $authenticated}

        	<div style="float:left; width:250px; text-align:left;height:80px;"><br/>
            <a class='mediumFont' href="{geturl controller='account' action='details'}">ACCOUNT</a> 
            {if $signedInUser->generalInfo->user_type=='storeSeller'}
			<br />
<a class="mediumFont" href="{geturl controller='eventmanager' action='distribtorapplication'}">DISTRIBUTORS</a>
            
            {/if}
            
            </div>
            {/if}
            {if $signedInUser->generalInfo->user_type=='storeSeller'}

            <div style="float:left; width:320px; text-align:left; height:80px;"><br/>
			<a class='mediumFont' href="{geturl controller='eventmanager' action='index'}">PROMOTIONS</a><br/>
			<a class='mediumFont' href="/productlisting/uploadcustomizeproduct">LIST PRODUCT</a> | <a class='mediumFont' href="/productlisting/viewpendingproduct">VIEW LISTINGS</a>
            </div>
            {/if}
            
                        {if !$authenticated}

        	<div style='float:right; width:130px; text-align:right;'>
            <br/>
<a class='mediumFont' href="/account/login">Login</a><br/></div>
            </div>
            
            {else}
				<div style='float:right; margin-top:50px;'>
				<a class='mediumFont' href="/account/logout">Logout</a><br/>
			{/if}
		</div>
		<div id="UIMessage">
		</div>
<div id='loadingImage' style='position:absolute; margin:0px; width:100%; height:100%; padding-left:30%; z-index: 100; display:none; opacity:0.8;'>
	<img src='/public/resources/css/images/loading.gif'/>
</div>
{literal}
<script type="text/javascript">
$j('a.colorBox').colorbox({width:'800',height:'100%'});

var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-18690243-1']);
_gaq.push(['_trackPageview']);

(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();


</script>
{/literal}
	</div>
</div>

</body>
</html>