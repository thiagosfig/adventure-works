

  create or replace table `indicium-academy-328121`.`adventureworks_marts`.`dim_special_offer`
  
  
  OPTIONS()
  as (
    with
     __dbt__cte__stg_specialoffer as (
with
    source as (
        select
            specialofferid,
            description,
            discountpct,
            type,
            category,
            startdate,
            enddate,
            minqty,
            maxqty,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`specialoffer`
    )

select * from source
),special_offer as (
        select
            specialofferid as special_offer_id,
            description,
            discountpct as discount_percentage,
            type,
            category,
            startdate as start_date,
            enddate as end_date,
        from __dbt__cte__stg_specialoffer as special_offer
    )

select * from special_offer
  );
    