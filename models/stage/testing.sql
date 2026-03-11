{% set name = 'Daniel' %}
{% set cars = ['lotus', 'alfa romeo', 'lexus'] %}
I am {{name}}

{% for i in cars %}
car name is {{i}}

{% endfor %}