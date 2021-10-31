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