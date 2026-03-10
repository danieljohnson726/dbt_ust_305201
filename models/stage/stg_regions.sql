with cte_regions as (
select
    r_regionkey as regionid,
    r_name name,
    r_comment comment
from
    {{ source('mk_mall', 'regions') }}
)

select
    regionid,
    name,
    comment
from
    cte_regions