select year_built from {{ ref('stg_properties') }}
where year_built > year(getdate())