with
    product as (
        select
            productid as product_id,
            name,
            productnumber as product_number,
            color,
            size,
            daystomanufacture as days_to_manufacture,
            productline as product_line,
            sellstartdate as sell_start_date,
            sellenddate as sell_end_date,
        from {{ ref('stg_product')}} as product
    )

select * from product
