with
    source as (
        select
            businessentityid as employeeid,
            nationalidnumber,
            loginid,
            jobtitle,
            currentflag,
            salariedflag,
            hiredate,
            gender,
            birthdate,
            maritalstatus,
            vacationhours,
            sickleavehours,
            organizationnode,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from {{ source('adventureworks', 'employee') }}
    )

select * from source
