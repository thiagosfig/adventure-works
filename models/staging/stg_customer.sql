with
    source as (
        select
            customerid,
            personid,
            storeid,
            territoryid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'customer') }}
    )

select * from source
