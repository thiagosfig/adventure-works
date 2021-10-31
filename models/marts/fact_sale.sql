with
    address as (
        select *
        from {{ ref('dim_address')}}
    ),
    customer as (
        select *
        from {{ ref('stg_customer')}}
    ),
    employee as (
        select *
        from {{ ref('dim_employee')}}
    ),
    product as (
        select *
        from {{ ref('dim_product')}}
    ),
    special_offer as (
        select *
        from {{ ref('dim_special_offer')}}
    ),
    ship_method as (
        select *
        from {{ ref('stg_shipmethod')}}
    ),
    sales_order_detail as (
        select *
        from {{ ref('stg_salesorderdetail')}}
    ),
    store as (
        select *
        from {{ ref('stg_store')}}
    ),
    credit_card as (
        select *
        from {{ ref('stg_creditcard')}}
    ),
    sales_order_header_sales_reason as (
        select *
        from {{ ref('stg_salesorderheadersalesreason')}}
    ),
    sales_reason as (
        select *
        from {{ ref('stg_salesreason')}}
    ),
    sale_with_sk as (
        select
            sale.salespersonid as employee_id,
            billtoaddressid as bill_address_id,
            shiptoaddressid as ship_address_id,
            sales_order_detail.productid as product_id,
            sales_order_detail.orderqty as order_quantity,
            sales_order_detail.specialofferid as special_offer_id,
            sale.customerid as customer_id,

            store.name as store_name,
            ship_method.name as ship_method,

            orderdate as order_date,
            duedate as due_date,
            shipdate as ship_date,
            status,
            onlineorderflag as online_order_flag,

            credit_card.cardnumber as credit_card_number,
            credit_card.cardtype as credit_card_type,

            subtotal as sub_total,
            taxamt as tax_amount,
            totaldue as total_due,

            sales_reason.name as reason_name,
            sales_reason.reasontype as reason_type
        from {{ ref('stg_salesorderheader')}} as sale
        left join sales_order_detail on
            sale.salesorderid = sales_order_detail.salesorderid
        left join customer on sale.customerid = customer.customerid
        left join store on customer.storeid = store.businessentityid
        left join credit_card on sale.creditcardid = credit_card.creditcardid
        left join sales_order_header_sales_reason on
            sale.salesorderid = sales_order_header_sales_reason.salesorderid
        left join sales_reason on
            sales_order_header_sales_reason.salesreasonid = sales_reason.salesreasonid
        left join ship_method on sale.shipmethodid = ship_method.shipmethodid
    )

select * from sale_with_sk
