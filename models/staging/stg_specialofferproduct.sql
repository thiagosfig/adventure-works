with
    source as (
        select
            specialofferid,
            productid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'specialofferproduct') }}
    )

select * from source
