
    <div id="leftContainer" style="width:250px;">
		<a class='mediumFont box' style="margin-bottom:10px;" href="{geturl controller='orderadministration' action='index'}">All order</a>

        <form method='post' name="trackingform" action="{geturl controller='orderadministration' action='submittracking'}" style="float:left; width:100%;">
        <div class="attributeinput" style="width:145px; float:left;">
        <input type=text name='tracking' style="height:30px; width:145px;" value="Tracking number" style="color:#cccccc;" onclick={literal}"if(this.value=='Tracking number'){this.clear()}"{/literal}>
        </div>        
        <button  style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer;" onClick="return checkform();">Enter track id</button>
    	<input type="hidden" value="{$order->order_unique_id}" name="id" />
        
        </form>  
        
        <div style="margin-top: 10px; margin-bottom:10px; border-top:1px solid #333; width:100%; float:left;"></div>
        
        <div class="box">
        
        	<a>Mark order as finished</a>
        
        </div>
        
           
        <div style="margin-top: 10px; margin-bottom:10px; border-top:1px solid #333; width:100%; float:left;"></div>
        

        <form style="float:left; width:100%; margin-top:20px;" action="{geturl controller='orderadministration' action='submitnotesfororder'}" method="post">
        	<textarea name='notes' cols="28" rows="5">Notes:</textarea>
            <input type="hidden" name='id' value="{$order->order_unique_id}"/>
            <button  style="height:36px; padding-top:10px; padding-bottom:10px; cursor:pointer;" onClick="return checkform();">Add notes to order</button>
        
        </form>
        
        
        
        
        
    </div>