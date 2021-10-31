with
    source as (
        select 
            shipmethodid,
            name,
            shipbase,
            shiprate,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'shipmethod') }}
    )

select * from source
