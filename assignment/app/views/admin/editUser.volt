<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("ios/", "&larr; Go Back") }}
    </li>
</ul>
{{ form("admin/save", 'role': 'form') }}

    <ul class="pager">
        <li class="previous pull-left">
            {{ link_to("admin/user", "&larr; Go Back") }}
        </li>
        <li class="pull-right">
            {{ submit_button("Save", "class": "btn btn-success") }}
        </li>
    </ul>

    {{ content() }}

    <h2>Edit User</h2>

    <fieldset>

        {% for element in form %}
            {% if is_a(element, 'Phalcon\Forms\Element\Hidden') %}
                {{ element }}
            {% else %}
                <div class="form-group">
                    {{ element.label() }}
                    {{ element.render(['class': 'form-control']) }}
                </div>
            {% endif %}
        {% endfor %}

    </fieldset>

</form>
