{{ content() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("windown/", "&larr; Go Back") }}
    </li>

    <div align="right">
        {{ link_to("windown/upload", "Upload app", "class": "btn btn-primary") }}
    </div>
</ul>

<div class="row thumbnail highlight">
	<div class="col-md-4">
		<img src="/assignment/{{ windown.images }}" alt="images" style="width: 200px; height: 300px;">
	</div>
	<div class="col-md-8" align="left">
		<h3>{{ windown.name }}</h3>
		<div>{{ windown.description }}</div>
		<hr>
		<div>{{ link_to("admin/download/" ~windown.id, windown.app, "class": "btn btn-success") }}</div>
	</div>
</div>