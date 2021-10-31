with
     __dbt__cte__stg_customer as (
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
),  __dbt__cte__stg_shipmethod as (
with
    source as (
        select 
            shipmethodid,
            name,
            shipbase,
            shiprate,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`shipmethod`
    )

select * from source
),  __dbt__cte__stg_salesorderdetail as (
with
    source as (
        select
            salesorderdetailid,
            salesorderid,
            productid,
            specialofferid,
            unitprice,
            unitpricediscount,
            orderqty,
            carriertrackingnumber,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at,
        from `indicium-academy-328121`.`adventureworks`.`salesorderdetail`
    )

select * from source
),  __dbt__cte__stg_store as (
with
    source as (
        select
            businessentityid,
            name,
            salespersonid,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`store`
    )

select * from source
),  __dbt__cte__stg_creditcard as (
with
    source as (
        select 
            creditcardid,
            cardtype,
            cardnumber,
            expmonth,
            expyear,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`creditcard`
    )

select * from source
),  __dbt__cte__stg_salesorderheadersalesreason as (
with
    source as (
        select
            salesorderid,
            salesreasonid,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`salesorderheadersalesreason`
    )

select * from source
),  __dbt__cte__stg_salesreason as (
with
    source as (
        select
            salesreasonid,
            name,
            reasontype,
            modifieddate,

            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`salesreason`
    )

select * from source
),  __dbt__cte__stg_salesorderheader as (
with
    source as (
        select 
            salesorderid,
            customerid,
            salespersonid,
            shipmethodid,
            billtoaddressid,
            shiptoaddressid,
            territoryid,
            currencyrateid,
            creditcardid,

            purchaseordernumber,
            taxamt,
            onlineorderflag,
            status,
            orderdate,
            creditcardapprovalcode,
            subtotal,
            revisionnumber,
            freight,
            duedate,
            totaldue,
            shipdate,
            accountnumber,
            modifieddate,

            rowguid,
            _sdc_sequence,
            _sdc_table_version,
            _sdc_received_at,
            _sdc_batched_at
        from `indicium-academy-328121`.`adventureworks`.`salesorderheader`
    )

select * from source
),address as (
        select *
        from `indicium-academy-328121`.`adventureworks_marts`.`dim_address`
    ),
    customer as (
        select *
        from __dbt__cte__stg_customer
    ),
    employee as (
        select *
        from `indicium-academy-328121`.`adventureworks_marts`.`dim_employee`
    ),
    product as (
        select *
        from `indicium-academy-328121`.`adventureworks_marts`.`dim_product`
    ),
    special_offer as (
        select *
        from `indicium-academy-328121`.`adventureworks_marts`.`dim_special_offer`
    ),
    ship_method as (
        select *
        from __dbt__cte__stg_shipmethod
    ),
    sales_order_detail as (
        select *
        from __dbt__cte__stg_salesorderdetail
    ),
    store as (
        select *
        from __dbt__cte__stg_store
    ),
    credit_card as (
        select *
        from __dbt__cte__stg_creditcard
    ),
    sales_order_header_sales_reason as (
        select *
        from __dbt__cte__stg_salesorderheadersalesreason
    ),
    sales_reason as (
        select *
        from __dbt__cte__stg_salesreason
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
        from __dbt__cte__stg_salesorderheader as sale
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