{{ content() }}

<div align="right">
	{{ link_to("ios/search", "Search", "class": "btn btn-success") }}
    {{ link_to("ios/upload", "Upload app", "class": "btn btn-primary") }}
</div>

<div class="row">
	{% if page.items is defined %}
	{% for ios in page.items %}
		{% if ios.active == "Y" %}
			<article>
			    <div class ="col-md-2">
				    <div class="thumbnail highlight">
				    	<img src="/assignment/{{ ios.images }}" alt="images" style="width: 150px; height: 150px;">
					    <h3>{{ ios.name }}</h3>
					    <div>{{ ios.description }}</div>
					    <div>{{ link_to("ios/detail/"~ios.id, "Xem chi tiết") }}</div>
				    </div>
				</div>
			</article>
		{% endif %}
	{% endfor %}
	</div>
		<ul class="pager">
			<li>{{ link_to("ios/", "First")}}</li>
			<li>{{ link_to("ios?page="~page.before, "Previous")}}</li>
			<li>{{ link_to("ios?page="~page.next, "Next") }}</li>
			<li>{{ link_to("ios?page="~page.last, "Last") }}</li>
		</ul>
	{% endif %}
</div>