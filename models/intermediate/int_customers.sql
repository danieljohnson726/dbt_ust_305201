select
    c .* ,n.name as nation, r.name as region
from
    {{ ref('stg_customers') }} c
join {{ ref('stg_nations') }} n
    on n.nationid = c.nation_id
join {{ ref('stg_regions') }} r
    on r.regionid = n.regionid