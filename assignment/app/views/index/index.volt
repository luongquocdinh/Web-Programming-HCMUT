{{ content() }}

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
			<li>{{ link_to("index/", "First")}}</li>
			<li>{{ link_to("index?page="~page.before, "Previous")}}</li>
			<li>{{ link_to("index?page="~page.next, "Next") }}</li>
			<li>{{ link_to("index?page="~page.last, "Last") }}</li>
		</ul>
	{% endif %}
</div>