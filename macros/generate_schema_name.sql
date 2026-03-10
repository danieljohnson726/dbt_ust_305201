{% macro generate_schema_name(custom_schema_name, node) -%}
    {# If a custom schema is set at model/folder, use it; otherwise use target.schema #}
    {% if custom_schema_name is not none %}
        {{ custom_schema_name | lower }}
    {% else %}
        {{ target.schema | lower }}
    {% endif %}
{%- endmacro %}