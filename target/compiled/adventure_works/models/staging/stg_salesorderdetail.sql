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