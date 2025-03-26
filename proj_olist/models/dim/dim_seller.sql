{{ config(materialized='view', schema='dim') }}

SELECT 
    seller_id, seller_zip_code_prefix, seller_city,seller_state 
FROM 
    `final-project-57294.ds_olist.olist_sellers_dataset` 
