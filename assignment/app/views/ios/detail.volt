{{ content() }}

<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("ios/", "&larr; Go Back") }}
    </li>

    <div align="right">
        {{ link_to("ios/upload", "Upload app", "class": "btn btn-primary") }}
    </div>
</ul>

<div class="row thumbnail highlight">
	<div class="col-md-4">
		<img src="/assignment/{{ ios.images }}" alt="images" style="width: 200px; height: 300px;">
	</div>
	<div class="col-md-8" align="left">
		<h3>{{ ios.name }}</h3>
		<div>{{ ios.description }}</div>
		<hr>
		<div>{{ link_to("admin/download/" ~ios.id, ios.app, "class": "btn btn-primary glyphicon glyphicon-download-alt") }}</div>
	</div>
</div>