{% macro money() -%}
::decimal(16,4)
{%- endmacro %}

{% macro dol_eur(colm, deci) -%}
round( 0.93 * {{ colm }}, {{ deci }})
{%- endmacro %}

{% macro dol_inr(colm, deci) -%}
round( 92.19 * {{ colm }}, {{ deci }})
{%- endmacro %}