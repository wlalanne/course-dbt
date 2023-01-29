{% macro grant_select_on_role(role) %}
    {% set sql %}
        GRANT USAGE ON SCHEMA {{ target.schema }} TO ROLE {{ role }};
        GRANT SELECT ON ALL TABLES IN SCHEMA {{ target.schema }} TO ROLE {{ role }};
        GRANT SELECT ON ALL VIEWS IN SCHEMA {{ target.schema }} TO ROLE {{ role }};
    {% endset %}

    {% do run_query(sql) %}
{% endmacro %}