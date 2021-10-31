select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    customer_id as unique_field,
    count(*) as n_records

from `indicium-academy-328121`.`adventureworks_marts`.`dim_customer`
where customer_id is not null
group by customer_id
having count(*) > 1



      
    ) dbt_internal_test