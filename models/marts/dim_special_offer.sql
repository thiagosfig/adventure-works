with
    special_offer as (
        select
            specialofferid as special_offer_id,
            description,
            discountpct as discount_percentage,
            type,
            category,
            startdate as start_date,
            enddate as end_date,
        from {{ ref('stg_specialoffer')}} as special_offer
    )

select * from special_offer
