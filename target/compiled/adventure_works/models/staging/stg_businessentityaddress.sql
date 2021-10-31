with
    source as (
        select
            businessentityid,
            addressid,
            addresstypeid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`businessentityaddress`
    )

select * from source