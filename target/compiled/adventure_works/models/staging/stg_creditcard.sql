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
        from `indicium-academy-328121`.`adventureworks`.`creditcard`
    )

select * from source