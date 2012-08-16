<label>Waist:</label>
<select name='sys_bottom_size' class='inputShiftOne'>
		
		<option value='71 cm'>71 cm</option>
		<option value='74 cm'>74 cm</option>
		<option value='76 cm'>76 cm</option>
        <option value='79 cm'>79 cm</option>
		<option value='81 cm'>81 cm</option>
        <option value='84 cm'>84 cm</option>
		<option value='86 cm'>86 cm</option>
		<option value='89 cm'>89 cm</option>
		<option value='92 cm'>92 cm</option>
		<option value='94 cm'>94 cm</option>
	
</select><br/>

<div class='titleBarMid marginTop20'><strong>Product details</strong></div>
{foreach from=$measurements item=measurement key=Key}
<label>{$Key}:</label>
	<select name='{$Key}' class='inputShiftOne'>
		{foreach from=$measurement item=value}
		<option value='{$value} cm'>{$value} cm</option>
		{/foreach}
	</select><br/>
{/foreach}
<div class='sys_quantity_div'>
			<label>Quantity:</label>
			<select name='sys_quantity' class='inputShiftOne'>
			<option value='1'>1</option>
			<option value='2'>2</option>
			<option value='3'>3</option>
			<option value='4'>4</option>
			<option value='5'>5</option>
			<option value='6'>5</option>
			<option value='7'>7</option>
			<option value='8'>8</option>
			<option value='9'>9</option>
			<option value='10'>10</option>
			</select>
			</div>
