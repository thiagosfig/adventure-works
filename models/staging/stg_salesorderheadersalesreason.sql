with
    source as (
        select
            salesorderid,
            salesreasonid,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'salesorderheadersalesreason') }}
    )

select * from source
