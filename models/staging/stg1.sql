{{ config(
    materialized='incremental' ,
    unique_key='id',
    on_schema_change='append_new_columns'
) }}


select * from {{ source('tpch', 'my_first_dbt_model') }}
{% if is_incremental() %}
WHERE id > (SELECT MAX(id) FROM {{ this }})
{% endif %}


