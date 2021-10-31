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