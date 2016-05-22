{{ content() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("android/", "&larr; Go Back") }}
    </li>

    <div align="right">
        {{ link_to("android/upload", "Upload app", "class": "btn btn-primary") }}
    </div>
</ul>

<div class="row thumbnail highlight">
	<div class="col-md-4">
		<img src="/assignment/{{ android.images }}" alt="images" style="width: 200px; height: 300px;">
	</div>
	<div class="col-md-8" align="left">
		<h3>{{ android.name }}</h3>
		<div>{{ android.description }}</div>
		<hr>
		<div>{{ link_to("admin/download/" ~android.id, android.app, "class": "btn btn-success") }}</div>
	</div>
</div>