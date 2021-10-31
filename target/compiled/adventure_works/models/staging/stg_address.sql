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