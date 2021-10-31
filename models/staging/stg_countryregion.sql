with
    source as (
        select
            countryregioncode,
            name,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'countryregion') }}
    )

select * from source
