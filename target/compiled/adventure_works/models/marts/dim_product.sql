with
     __dbt__cte__stg_product as (
with
    source as (
        select
            productid,
            name,
            productnumber,
            productmodelid,
            productsubcategoryid,
            standardcost,
            listprice,
            daystomanufacture,
            productline,
            safetystocklevel,
            makeflag,
            finishedgoodsflag,
            class,
            reorderpoint,
            color,
            style,
            size,
            sizeunitmeasurecode,
            weight,
            weightunitmeasurecode,
            sellstartdate,
            sellenddate,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`product`
    )

select * from source
),product as (
        select
            productid as product_id,
            name,
            productnumber as product_number,
            color,
            size,
            daystomanufacture as days_to_manufacture,
            productline as product_line,
            sellstartdate as sell_start_date,
            sellenddate as sell_end_date,
        from __dbt__cte__stg_product as product
    )

select * from product