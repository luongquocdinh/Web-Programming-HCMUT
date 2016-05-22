<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("admin/", "&larr; Go Back") }}
    </li>
</ul>
<h2>List User</h2>

<table class="table table-bordered table-striped" name="users">
    <thead>
        <tr>
            <td>Id</td>
            <td>Name</td>
            <td>User name</td>
            <td>Email</td>
            <td>Role</td>
        </tr>
    </thead>
    <tbody>
        {% for user in page.items %}
            <tr>
                <td>{{user.id}}</td>
                <td>{{user.name}}</td>
                <td>{{user.username}}</td>
                <td>{{user.email}}</td>
                <td>{{user.role}}</td>
                <td width="7%">{{ link_to("admin/editUser/" ~ user.id, '<i class="glyphicon glyphicon-edit"></i> Edit', "class": "btn btn-default") }}</td>
            <td width="7%">{{ link_to("admin/deleteUser/" ~ user.id, '<i class="glyphicon glyphicon-remove"></i> Delete', "class": "btn btn-default") }}</td>
            </tr>
        {% endfor %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("admin/user", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
                    {{ link_to("admin/user?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn") }}
                    {{ link_to("admin/user?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn") }}
                    {{ link_to("admin/user?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn") }}
                    <span class="help-inline">{{ page.current }} of {{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tbody>
</table>

