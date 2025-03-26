{{ config(materialized='view', schema='fact') }}

SELECT DISTINCT 
    customer_id, o.order_id, order_item_id,
    product_id, seller_id, price, freight_value, order_approved_at
    order_purchase_timestamp, order_delivered_customer_date, order_estimated_delivery_date
FROM 
    `final-project-57294.ds_olist.olist_orders_dataset` AS o
INNER JOIN 
    `final-project-57294.ds_olist.olist_order_items_dataset` AS i
ON 
    o.order_id = i.order_id
