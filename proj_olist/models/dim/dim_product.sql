{{ config(materialized='view', schema='dim') }}

SELECT product_id, product_category_name
--FROM `my-project-02-451512.ds_olist.olist_products_dataset` 
FROM `final-project-57294.ds_olist.olist_products_dataset` 
limit 5