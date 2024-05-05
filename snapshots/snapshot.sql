{% snapshot orders_snapshot %}

{{
    config(
      materialized='snapshot',
      target_database='JMAN',
      target_schema='RAW',
      unique_key='id',

      strategy='check',
      check_cols=['status'],
      invalidate_hard_deletes=True,
    )
}}

select * from {{ source('tpch', 'my_first_dbt_model') }}

{% endsnapshot %}