with cte_nations as (
select
    n_nationkey as nationid,
    n_name as name,
    n_regionkey as regionid,
    n_comment as comment
from
    {{ source('mk_mall', 'nations') }}
)

select
    nationid,
    name,
    regionid,
    comment
from
   cte_nations