{{ config (
    query_tag = 'nations',
    tags = 'stg',
    pre_hook = 'alter session set timezone = "Asia/Kolkata"'

) }}

with cte_nations as (
select
    n_nationkey as nationid,
    n_name as name,
    n_regionkey as regionid,
    n_comment as comment,
    current_timestamp as cuurent_time_with_timezone
from
    {{ source('mk_mall', 'nations') }}
)

select
    nationid,
    name,
    regionid,
    comment,
    cuurent_time_with_timezone
from
   cte_nations