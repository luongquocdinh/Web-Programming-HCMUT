
{{ content() }}

<div align="right">
    {{ link_to("android/new", "Create android", "class": "btn btn-primary") }}
</div>

{{ form("android/search") }}

<h2>Search android</h2>

<fieldset>

	<p> {{ form.label('Name') }} </p>
	<p> 
		{{ form.render('Name') }} 
	</p>

<div class="control-group">
    {{ link_to("android/result", "Upload app", "class": "btn btn-primary") }}
</div>

</fieldset>

</form>
