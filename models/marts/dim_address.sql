with
    stateprovince as (
        select *
        from {{ ref('stg_stateprovince')}}
    ),
    countryregion as (
        select *
        from {{ ref('stg_countryregion')}}
    ),
    address as (
        select
            addressid as address_id,
            addressline1 as address_line_1,
            addressline2 as address_line_2,
            city,
            stateprovince.name as state_province_name,
            countryregion.name as country_name
        from {{ ref('stg_address')}} as address
        left join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
        left join countryregion on
            stateprovince.countryregioncode = countryregion.countryregioncode
    )
select * from address
