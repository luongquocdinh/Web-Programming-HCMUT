<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("admin/", "&larr; Go Back") }}
    </li>
</ul>
<h2>List Application Upload</h2>

<table class="table table-bordered table-striped" name="users">
    <thead>
        <tr>
            <td>Id</td>
            <td>Name</td>
            <td>Description</td>
            <td>Images</td>
            <td>Application</td>
        </tr>
    </thead>
    <tbody>
        {% for windown in page.items %}
            <tr>
                <td>{{windown.id}}</td>
                <td>{{windown.name}}</td>
                <td>{{windown.description}}</td>
                <td><img src="/assignment/{{ windown.images }}" alt="images" style="width: 50px; height: 50px;"></td>
                <td>{{ link_to("admin/downloadwindown/" ~windown.id, windown.app) }}</td>
                <td width="7%">{{ link_to("admin/addwindown/" ~ windown.id, '<i class="glyphicon glyphicon-edit"></i> Add', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("admin/deletewindown/" ~ windown.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-default") }}</td>
            </tr>
        {% endfor %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("admin/windown", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
                    {{ link_to("admin/windown?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn") }}
                    {{ link_to("admin/windown?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn") }}
                    {{ link_to("admin/windown?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn") }}
                    <span class="help-inline">{{ page.current }} of {{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tbody>
</table>

