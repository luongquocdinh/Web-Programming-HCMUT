{{ content() }}

<ul class="pager">
    <li class="previous">
        {{ link_to("windown", "&larr; Go Back") }}
    </li>
</ul>

{% for windown in page.items %}
    {% if loop.first %}
<table class="table table-bordered table-striped" align="center">
    <thead>
        <tr>
            <th>Name</th>
        </tr>
    </thead>
    <tbody>
    {% endif %}
        <tr>
            <td>{{ windown.getwindown().name }}</td>
            <td width="7%">{{ link_to("windown/detail/" ~ windown.id, '<i class="glyphicon glyphicon-edit"></i> Detail', "class": "btn btn-default") }}</td>
        </tr>
    {% if loop.last %}
    </tbody>
    <tbody>
        <tr>
            <td colspan="7" align="right">
                <div class="btn-group">
                    {{ link_to("windown/search", '<i class="icon-fast-backward"></i> First', "class": "btn") }}
                    {{ link_to("windown/search?page=" ~ page.before, '<i class="icon-step-backward"></i> Previous', "class": "btn") }}
                    {{ link_to("windown/search?page=" ~ page.next, '<i class="icon-step-forward"></i> Next', "class": "btn") }}
                    {{ link_to("windown/search?page=" ~ page.last, '<i class="icon-fast-forward"></i> Last', "class": "btn") }}
                    <span class="help-inline">{{ page.current }} of {{ page.total_pages }}</span>
                </div>
            </td>
        </tr>
    </tbody>
</table>
    {% endif %}
{% else %}
    No windown are recorded
{% endfor %}
