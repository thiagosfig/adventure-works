with
    person as (
        select *
        from {{ ref('stg_person')}}
    ),
    employee as (
        select
            employeeid as employee_id,
            person.persontype as person_type,
            person.firstname as first_name,
            person.middlename as middle_name,
            person.lastname as last_name,
            hiredate as hire_date,
        from {{ ref('stg_employee')}} as employee
        left join person on employee.employeeid = person.personid
    )

select * from employee
