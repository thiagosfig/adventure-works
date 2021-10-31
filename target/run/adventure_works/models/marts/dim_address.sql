

  create or replace table `indicium-academy-328121`.`adventureworks_marts`.`dim_address`
  
  
  OPTIONS()
  as (
    with
     __dbt__cte__stg_stateprovince as (
with
    source as (
        select
            stateprovinceid,
            name,
            stateprovincecode,
            countryregioncode,
            territoryid,
            isonlystateprovinceflag,
            modifieddate,

            rowguid,
            _sdc_table_version,
            _sdc_sequence,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`stateprovince`
    )

select * from source
),  __dbt__cte__stg_countryregion as (
with
    source as (
        select
            countryregioncode,
            name,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`countryregion`
    )

select * from source
),  __dbt__cte__stg_address as (
with
    source as (
        select 
            addressid,
            addressline1,
            addressline2,
            city,
            stateprovinceid,
            postalcode,
            spatiallocation,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`address`
    )

select * from source
),stateprovince as (
        select *
        from __dbt__cte__stg_stateprovince
    ),
    countryregion as (
        select *
        from __dbt__cte__stg_countryregion
    ),
    address as (
        select
            addressid as address_id,
            addressline1 as address_line_1,
            addressline2 as address_line_2,
            city,
            stateprovince.name as state_province_name,
            countryregion.name as country_name
        from __dbt__cte__stg_address as address
        left join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
        left join countryregion on
            stateprovince.countryregioncode = countryregion.countryregioncode
    )
select * from address
  );
    