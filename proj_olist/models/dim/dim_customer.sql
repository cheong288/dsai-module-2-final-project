{{ config(materialized='view', schema='dim') }}

SELECT 
    customer_id, customer_unique_id,
    customer_zip_code_prefix, customer_city,customer_state 
FROM 
    `final-project-57294.ds_olist.olist_customers_dataset` 
