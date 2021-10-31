with
    source as (
        select 
            creditcardid,
            cardtype,
            cardnumber,
            expmonth,
            expyear,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'creditcard') }}
    )

select * from source
