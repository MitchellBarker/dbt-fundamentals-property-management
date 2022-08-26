with leases as (
    select * from {{ ref('stg_leases') }}
),

rental_applications as (
    select * from {{ ref('stg_rental_applications') }}
),

units as (
    select * from {{ ref('stg_units') }}
)

select
    lease_id,
    rental_application_id,
    unit_id,
    leases.start_date,
    leases.end_date,
    leases.completed,
    rental_applications.deleted_at,
    rental_applications.status as rental_application_status,
    rental_applications.contact_info_id,
    units.name as unit_name,
    units.rent,
    units.bedrooms,
    units.bathrooms,
    units.square_feet,
    units.status as unit_status,
    units.address_1,
    units.address_2,
    units.city,
    units.state,
    units.zip_code
 from leases
left join rental_applications using (rental_application_id)
left join units using (unit_id)