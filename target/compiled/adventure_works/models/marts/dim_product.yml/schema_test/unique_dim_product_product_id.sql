
    
    

select
    product_id as unique_field,
    count(*) as n_records

from `indicium-academy-328121`.`adventureworks_marts`.`dim_product`
where product_id is not null
group by product_id
having count(*) > 1


