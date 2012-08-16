<html>
<body>

<table>

<tr>
<td>
<div class='headerText'>Message from online VEdance: {$online_message->ts_created|date_format:'%b %e, %Y %l:%M %p'}</div>
<div class='message'>
<label>First name:</label>{$online_message->first_name}<br/>
<label>Last name:</label>{$online_message->last_name}<br/>
<label>Phone number:</label>{$online_message->phone_number}<br/>
<label>Email:</label>{$online_message->email}<br/>
<label>Message:</label>{$online_message->description}<br/>
</td>
</tr>

</table>