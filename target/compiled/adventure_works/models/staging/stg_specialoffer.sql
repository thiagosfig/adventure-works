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