with
    source as (
        select
            stateprovinceid,
            name,
            stateprovincecode,
            countryregioncode,
            territoryid,
            isonlystateprovinceflag,
            modifieddate,

            rowguid,
            _sdc_table_version,
            _sdc_sequence,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`stateprovince`
    )

select * from source