<p>VEdance is proud to partner with university groups and ballroom studios across the United States to provide quality, affordable dancewear to their local dance members. Increase the professional feel of your studio and the competitiveness of your ballroom members by outfitting your coaches and dancers with our dance apparel.</p>
 
<p>Through our partnerships, we provide one unique dance promotion code per ballroom organization and these codes are linked to designated shipping addresses.</p>
 
<p>For universities, when your members use your designated promotion code, VEdance merchandise will only be delivered to that organization&acute;s address. Pick-ups can then be made possible by individual members thereafter.</p>
 
<p>For studios, using your promotion code you may purchase our apparel at the <span style="font-style:italic"><strong>distributor discount</strong></span> and allow your members to buy VEdance merchandise at our current price. If for any reason you would like to close your account with us, our no-risk return policy allows you to recoup your investments in our apparel. Simply send us back all remaining, un-sold pants and we will refund 100% of your money for each pair returned.</p>

<p>If you are a ballroom organization coordinator or leader and are interested in partnering with us to provide quality dancewear for your dancers, please fill out the form below and one of our representatives will get back with you shortly.</p>

<p>We look forward to hearing from you.</p>


	<form method="post" action="{geturl controller='index' action='index'}" style="float:left; margin-left:150px;" id="registration-form">	


            <div class="row box" id="form_organization_name_container">
                <input id='form_organization_name' type=text name="organization_name" style="height:30px; width:200px; color:#cccccc;" value="{if $fp->organization_name}{$fp->organization_name|escape}{else}Organization name{/if}" onclick={literal}"if(this.value=='Organization name'){this.clear()}"{/literal}>
                {include file='partials/error.tpl' error=$fp->getError('organization_name')}
            </div>
            
            <div class="row box" id="form_password_container">
                <input id='form_organization_primary_contact' type=text name="organization_primary_contact" style="height:30px; width:200px; color:#cccccc;" value="{if $fp->organization_primary_contact}{$fp->organization_primary_contact|escape}{else}Organization primary contact{/if}" onclick={literal}"if(this.value=='Organization primary contact'){this.clear()}"{/literal}>
                {include file='partials/error.tpl' error=$fp->getError('organization_primary_contact')}
            </div>
            
            <div class="row box" id="form_organization_primary_phone_container">
                <input id='form_organization_primary_phone' type=text name="organization_primary_phone" style="height:30px; width:200px; color:#cccccc;" value="{if $fp->organization_primary_phone}{$fp->organization_primary_phone|escape}{else}Organization primary phone{/if}" onclick={literal}"if(this.value=='Organization primary phone'){this.clear()}"{/literal}>
                {include file='partials/error.tpl' error=$fp->getError('organization_primary_phone')}
            </div>
    
            
            <div class="row box" id="form_email_container">
                <input type=text name="organization_email" style="height:30px; width:200px; color:#cccccc;" value="{if $fp->organization_email}{$fp->organization_email}{else}Organization primary email{/if}" onclick={literal}"if(this.value=='Organization primary email'){this.clear()}"{/literal}>
                {include file='partials/error.tpl' error=$fp->getError('organization_email')}
            </div>
            
           
            
            <button name="subscribe" style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer; float:left; width:150px;" >Apply</button>
        
        </form>

<p>VEdance LLC</p>
