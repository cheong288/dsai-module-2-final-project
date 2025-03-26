{{ config(materialized='view', schema='dim') }}

SELECT 
    product_id, product_category_name
FROM 
    `final-project-57294.ds_olist.olist_products_dataset` 
Limit 10
