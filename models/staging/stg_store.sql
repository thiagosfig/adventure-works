with
    source as (
        select
            businessentityid,
            name,
            salespersonid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'store') }}
    )

select * from source
