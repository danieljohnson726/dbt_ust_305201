{% test is_even(model, column_name, checkvalue) %}
with validation as (
    select
        {{ column_name }}::number as even_field
    from {{ model }}
),
validation_errors as (
    select
        even_field
    from validation
    -- if this is true, then even_field is actually odd!
    where even_field < {{ checkvalue}}
)
select *
from validation_errors
{% endtest %}