{{ content() }}

<div align="right">
	{{ link_to("windown/search", "Search", "class": "btn btn-success") }}
    {{ link_to("windown/upload", "Upload app", "class": "btn btn-primary") }}
</div>

<div class="row">
	{% if page.items is defined %}
	{% for windown in page.items %}
		{% if windown.active == "Y" %}
			<article>
			    <div class ="col-md-2">
				    <div class="thumbnail highlight">
				    	<img src="/assignment/{{ windown.images }}" alt="images" style="width: 150px; height: 150px;">
					    <h3>{{ windown.name }}</h3>
					    <div>{{ windown.description }}</div>
					    <div>{{ link_to("windown/detail/"~windown.id, "Xem chi tiết") }}</div>
				    </div>
				</div>
			</article>
		{% endif %}
	{% endfor %}
	</div>
		<ul class="pager">
			<li>{{ link_to("windown/", "First")}}</li>
			<li>{{ link_to("windown?page="~page.before, "Previous")}}</li>
			<li>{{ link_to("windown?page="~page.next, "Next") }}</li>
			<li>{{ link_to("windown?page="~page.last, "Last") }}</li>
		</ul>
	{% endif %}
</div>