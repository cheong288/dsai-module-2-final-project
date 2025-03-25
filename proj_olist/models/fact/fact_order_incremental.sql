{{
  config(
    materialized = 'incremental',
    unique_key = 'order_id',
    incremental_strategy = 'merge',
    schema='fact'
  )
}}

SELECT 
  customer_id,
  o.order_id,
  order_purchase_timestamp,
  payment_value,payment_type ,
  CONCAT(EXTRACT(YEAR FROM order_purchase_timestamp), '-', 
         FORMAT("%02d", EXTRACT(MONTH FROM order_purchase_timestamp))) 
    AS purchase_month_and_year,
  EXTRACT(YEAR FROM order_purchase_timestamp) AS purchase_year
FROM 
  `final-project-57294.ds_olist.olist_orders_dataset` AS o
INNER JOIN `final-project-57294.ds_olist.olist_order_payments_dataset` AS p
ON o.order_id = p.order_id
{% if is_incremental() %}
WHERE 
  CONCAT(EXTRACT(YEAR FROM order_purchase_timestamp), '-', 
         FORMAT("%02d", EXTRACT(MONTH FROM order_purchase_timestamp))) 
  > (SELECT MAX(purchase_month_and_year) FROM {{ this }} )
  {% endif %}
  order by order_purchase_timestamp 
  limit 20