
{{ content() }}

<div align="right">
    {{ link_to("windown/new", "Create windown", "class": "btn btn-primary") }}
</div>

{{ form("windown/search") }}

<h2>Search windown</h2>

<fieldset>

	<p> {{ form.label('Name') }} </p>
	<p> 
		{{ form.render('Name') }} 
	</p>

<div class="control-group">
    {{ link_to("windown/result", "Upload app", "class": "btn btn-primary") }}
</div>

</fieldset>

</form>
