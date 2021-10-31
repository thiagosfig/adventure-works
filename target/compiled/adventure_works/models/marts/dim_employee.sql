with
     __dbt__cte__stg_person as (
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
),  __dbt__cte__stg_employee as (
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
        from `indicium-academy-328121`.`adventureworks`.`employee`
    )

select * from source
),person as (
        select *
        from __dbt__cte__stg_person
    ),
    employee as (
        select
            employeeid as employee_id,
            person.persontype as person_type,
            person.firstname as first_name,
            person.middlename as middle_name,
            person.lastname as last_name,
            hiredate as hire_date,
        from __dbt__cte__stg_employee as employee
        left join person on employee.employeeid = person.personid
    )

select * from employee