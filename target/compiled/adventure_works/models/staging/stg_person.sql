with
    source as (
        select
            businessentityid as personid,
            persontype,
            namestyle,
            title,
            firstname,
            middlename,
            lastname,
            suffix,
            emailpromotion,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`person`
    )

select * from source