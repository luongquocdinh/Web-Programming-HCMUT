
{{ content() }}

<div align="right">
    {{ link_to("ios/new", "Create ios", "class": "btn btn-primary") }}
</div>

{{ form("ios/search") }}

<h2>Search ios</h2>

<fieldset>

	<p> {{ form.label('Name') }} </p>
	<p> 
		{{ form.render('Name') }} 
	</p>

<div class="control-group">
    {{ link_to("ios/result", "Upload app", "class": "btn btn-primary") }}
</div>

</fieldset>

</form>
