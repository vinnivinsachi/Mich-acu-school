<html>
<body>

<table>

<tr>
<td>
<div class='headerText'>Order reviewed on: {$online_message->ts_created|date_format:'%b %e, %Y %l:%M %p'}</div>
<div class='message'>
<label>Order id:</label>{$online_message->order_unique_id}<br/>
<label>Review:</label>{$online_message->order_review}<br/>

<img src="http://www.vedance.com/public/resources/css/images/VEdance/VEBoxprintVerticalFooter_1.png" />
</td>
</tr>
<tr>
	<td width="100%;" background="http://www.vedance.com/public/resources/css/images/VEdance/VEBoxprintVerticalFooter_1.png" height="80px;"></td>
</tr>
</table>