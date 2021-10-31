with
    source as (
        select
            salesreasonid,
            name,
            reasontype,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`salesreason`
    )

select * from source