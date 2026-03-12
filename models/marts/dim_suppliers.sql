{{
    config (
        materialized='incremental'
            )
}}

with supplier as (
    select * from {{ ref('stg_suppliers') }}
    {% if is_incremental() %}
    where updated_time > (select max(updated_time) from {{ this }} )
    {% endif %}
  ),

nation as (
    select * from {{ ref('stg_nations') }}
),

region as (
    select * from {{ ref('stg_regions') }}
),

final as (
    select 
        supplier.supplier_id,
        supplier.supplier_name,
        supplier.supplier_address,
        nation.name as nation,
        region.name as region,
        supplier.phone_number,
        supplier.account_balance,
        supplier.updated_time
    from
        supplier
    left join nation
            on supplier.nation_id = nation.nationid
    inner join region 
            on nation.regionid = region.regionid
)

select * from final