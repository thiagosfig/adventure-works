
    
    

select
    address_id as unique_field,
    count(*) as n_records

from `indicium-academy-328121`.`adventureworks_marts`.`dim_address`
where address_id is not null
group by address_id
having count(*) > 1


