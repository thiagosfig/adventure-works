with
    person as (
        select *
        from {{ ref('stg_person')}}
    ),
    customer as (
        select
            customerid as customer_id,
            person.persontype as person_type,
            person.firstname as first_name,
            person.middlename as middle_name,
            person.lastname as last_name,
        from {{ ref('stg_customer')}} as customer
        left join person on customer.personid = person.personid
    )

select * from customer
