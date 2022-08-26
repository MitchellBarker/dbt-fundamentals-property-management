with properties as (
    select * from {{ ref('stg_properties')}}
),

units as (
    select * from {{ ref('stg_units') }}
)

select 
    unit_id,
    property_id,
    properties.name as property_name,
    units.name as unit_name,
    units.rent,
    units.bedrooms,
    units.bathrooms,
    units.square_feet,
    units.status,
    units.address_1,
    units.address_2,
    units.city,
    units.state,
    units.zip_code,
    properties.type,
    properties.year_built

from units
left join properties using (property_id)