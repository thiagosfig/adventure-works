with
    source as (
        select
            businessentityid,
            salesquota,
            commissionpct,
            bonus,
            salesytd,
            saleslastyear,
            territoryid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'salesperson') }}
    )

select * from source
