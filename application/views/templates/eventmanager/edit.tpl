{include file="layouts/$layout/header.tpl" lightbox=true}

<form method="post" action="{geturl controller='eventmanager' action='edit'}/?id={$fp->event->getId()}">
	
	{if $fp->hasError()}
		<div class="error">
			An error has occured in the form below. Please check the highlighted fields and resubmit the form.
		</div>
	{/if}

	
	<fieldset>
		<legend>Event Details</legend>
		
		<div class="row" id="form_title_container">
			<label for="form_title">Title:</label>
			<input type="text" id="form_title" name="title" value="{$fp->name}"/>
			{include file='partials/error.tpl' error=$fp->getError('title')}

		</div>
		
		<div class="row" id="form_startdate_container">
			<label for="form_startdate">Start Time:</label>
			{html_select_date prefix='ts_created' 
							  time=$fp->ts_created
							  start_year=-2
							  end_year=+2}
			
			{html_select_time prefix='ts_created'
							  time=$fp->ts_created
							  display_seconds = false
							  use_24_hours=false}
			
		</div>
		
		<div class="row" id="form_enddate_container">
			<label for="form_enddate">End Time:</label>
			{html_select_date prefix='ts_end' 
							  time=$fp->ts_end

							  start_year=-2
							  end_year=+2}
			
			{html_select_time prefix='ts_end'
							  time=$fp->ts_end
							  display_seconds = false
							  use_24_hours=false}
		</div>
		
		<div class="row" id="form_promotion">
		
			<label for="form_promotion_code">Promotion Code: </label>
			
			<input type="text" id="form_promotion_code" name="promotion_code" value="{$fp->promotion_code}" />
			{include file='partials/error.tpl' error=$fp->getError('promotion_code')}
		</div>
		
		
		
		
		
		<div class="row" id="form_ticket_price">
			<label for="form_ticket_price">Promotion_dollar:</label>
			
	
			<input type="text" id="form_ticket_price" name="ticket_price" value="{if $fp->event->profile->price==0}FREE{else} {$fp->event->profile->price} {/if}" />
			
			
			{include file='partials/error.tpl' error=$fp->getError('ticket_price')}
		</div>
		
		<div class="row" id="form_ticket_percentage">
			<label for="form_ticket_percentage">Promotion_percentage:</label>
			<input type="text" id="form_ticket_percentage" name="ticket_percentage" value="{if $fp->event->profile->percentage==0}FREE{else} {$fp->event->profile->percentage} {/if}" />
			
			{include file='partials/error.tpl' error=$fp->getError('ticket_percentage')}
		</div>
		
		
		
		<div class="wysiwyg">
			{wysiwyg name='content' value=$fp->content}
			{include file='partials/error.tpl' error=$fp->getError('content')}
		</div>
		
	</fieldset>
	
	<div class="submit">
	
		
		{if $fp->event->isLive()}
			{assign var='label' value='Save Changes'}
		{elseif $fp->event->isSaved()}
			{assign var='label' value='Save Changes and Send Live'}
		{else}
			{assign var='label' value='Create and Send Live'}
		{/if}
		
		<input type="submit" value="{$label|escape}"/>
		{if !$fp->event->isLive()}
			<input type="submit" name="preview" value="Preview This Event"/>
		{/if}
	</div>
	
</form>

{if $identity->profile->paypalEmail ==''}
{include file="layouts/$layout/footer.tpl"}
{else}
{include file="layouts/$layout/footer.tpl"}
{/if}
