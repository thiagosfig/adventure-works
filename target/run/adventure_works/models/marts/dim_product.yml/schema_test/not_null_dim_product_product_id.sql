select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select *
from `indicium-academy-328121`.`adventureworks_marts`.`dim_product`
where product_id is null



      
    ) dbt_internal_test