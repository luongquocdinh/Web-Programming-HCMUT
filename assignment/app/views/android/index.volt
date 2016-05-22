{{ content() }}

<div align="right">
    {{ link_to("android/search", "Search", "class": "btn btn-success") }}
     {{ link_to("android/upload", "Upload app", "class": "btn btn-primary") }}
</div>

<div class="row">
    {% if page.items is defined %}
    {% for android in page.items %}
        {% if android.active == "Y" %}
            <article>
                <div class ="col-md-2">
                    <div class="thumbnail highlight">
                        <img src="/assignment/{{ android.images }}" alt="images" style="width: 150px; height: 150px;">
                        <h3>{{ android.name }}</h3>
                        <div>{{ android.description }}</div>
                        <div>{{ link_to("android/detail/"~android.id, "Xem chi tiết") }}</div>
                    </div>
                </div>
            </article>
        {% endif %}
    {% endfor %}
    </div>
        <ul class="pager">
            <li>{{ link_to("android/", "First")}}</li>
            <li>{{ link_to("android?page="~page.before, "Previous")}}</li>
            <li>{{ link_to("android?page="~page.next, "Next") }}</li>
            <li>{{ link_to("android?page="~page.last, "Last") }}</li>
        </ul>
    {% endif %}
</div>