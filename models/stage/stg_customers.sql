{{ config(materialized = 'table',
transient = false) }}

with customer as (
select
    c_custkey as customer_id,
    c_nationkey as nation_id,
    c_name as name,
    c_address as address,
    c_phone as phone_number,
    c_acctbal as account_balance,
    c_mktsegment as market_segment,
    c_comment as comment
from
    {{ source('mk_mall', 'customers') }}
)
select
    customer_id,
    nation_id,
    name,
    address,
    phone_number,
    account_balance,
    market_segment,
    comment
from
    customer