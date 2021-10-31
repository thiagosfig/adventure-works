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
),  __dbt__cte__stg_customer as (
with
    source as (
        select
            customerid,
            personid,
            storeid,
            territoryid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`customer`
    )

select * from source
),person as (
        select *
        from __dbt__cte__stg_person
    ),
    customer as (
        select
            customerid as customer_id,
            person.persontype as person_type,
            person.firstname as first_name,
            person.middlename as middle_name,
            person.lastname as last_name,
        from __dbt__cte__stg_customer as customer
        left join person on customer.personid = person.personid
    )

select * from customer