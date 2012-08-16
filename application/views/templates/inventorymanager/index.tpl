{include file="layouts/$layout/header.tpl" lightbox=true}
<div id='wrapper'>

<form method="get" action="{geturl controller='inventorymanager' action='index'}">
<input type="radio" name='style' value="women" />Women<input type="radio" name="style" value="men" />Men<br />
<input type="radio" name="tag" value="latin" />Latin<input type="radio" name="tag" value="standard" />Standard<br />
<select name="order">
<option value='size'>Size</option>
</select>

<input type="submit" value="filter" />
</form>


<div id="rightColumn" style="width:800px; float:right; margin-bottom:80px;">
<div class="box">
<form method='post' action="{geturl controller='inventorymanager' action='index'}">
<label>Please enter inventory code</label>
<input type="text" name="code" id='code'/>

<input type="submit" value="submit" />

</form>
</div>
<div class="box">
{$inventories|@count} number of total shoes
</div>
<table width="100%">
<tr><td>Code</td>
<td>Sex</td>
<td>Tag</td>
<td>Metric</td>
<td>Size</td>
<td>Action</td>
</tr>
{foreach from=$inventories item=inventory}
<tr>
	<td>{$inventory.code}</td>
    <td>{$inventory.style}</td>
    <td>{$inventory.tag}</td>
    <td>{$inventory.metric}</td>
    <td>{$inventory.size}</td>
    <td><form method="post" action="{geturl controller='inventorymanager' action='checkout'}?id={$inventory.id}">
    <input type="submit" value="remove" /></form></td>
</tr>
{/foreach}
</table>

</div>

</div>




{literal}
<script type="text/javascript">
$('code').focus();
</script>
{/literal}


{include file="layouts/$layout/footer.tpl"}