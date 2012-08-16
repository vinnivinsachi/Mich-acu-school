{include file="layouts/$layout/header.tpl" lightbox=true}
<div id="bottomBody" style="background-color:#f3f3f3;">
<div id="leftContainer">
    <div class='box'>
    <div class='titleBarBig'><strong>Log into your account</strong></div>
    <form method="post" action="{geturl action='login' controller='account'}" id="login-form" style='width:100%; float:left'>
    
        <input type="hidden" name="redirect" value="{$redirect|escape}" />
        
                <div>
                     <label for="form_username">Username:</label>
                     <input type="text" id="form_username" name="username" value="{$username|escape}"/>
                    
                     {include file='partials/error.tpl' error=$errors.username}
                   
                </div>
                <div>
                    <label for="form_password">Password:</label>
                    <input type="password" id="form_password" name="password" value="{$password|escape}" AUTOCOMPLETE="off"/>
                    {include file='partials/error.tpl' error=$errors.password}   
                </div>
        
        <a href="/account/fetchpassword">Forgot your password?</a>
        
        
        
            <button class="submit" value="Login" name="login">Login</button>		
    
    </form>
    </div>



</div>


{literal}
    
    <script type="text/javascript">
		new loginFormEnhancer('registration-form');
	</script>

{/literal}
</div>

{include file="layouts/$layout/footer.tpl"}