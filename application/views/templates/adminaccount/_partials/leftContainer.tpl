<div id="leftContainer" style="width:250px;">
{literal}
<script src="/public/resources/javascripts/slidemenu.js" type="text/javascript"></script>

{/literal}

<form method='get' name="" action="{geturl controller='adminaccount' action='users'}" style="float:left; width:100%;">
<input type=text name="email" style="height:30px; width:145px; float:left;" value="Your email" />

<button style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer; font-size:10px;" >Search by Email</button>
</form>


<div style="width:100%; float:left;">

<ul id="qm0" class="qmmc" style="width:100%;">
            
            
            <li><a class="qmparent" href="javascript:void(0)">Users</a>
            	<ul>
                	<li><a href="">General Sellers</a></li>
                    <li><a href="">Members</a></li>
                    
                </ul>	
            </li>
</ul>
           
<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all', 'main' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
{literal}
<script type="text/javascript">qm_create(0,true,0,500,'all',false,false,false,false);</script>
{/literal}
</div>
</div>