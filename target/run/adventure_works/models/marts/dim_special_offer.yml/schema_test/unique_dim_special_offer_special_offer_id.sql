select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
    

select
    special_offer_id as unique_field,
    count(*) as n_records

from `indicium-academy-328121`.`adventureworks_marts`.`dim_special_offer`
where special_offer_id is not null
group by special_offer_id
having count(*) > 1



      
    ) dbt_internal_test