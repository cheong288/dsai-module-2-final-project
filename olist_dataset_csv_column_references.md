### CSV Files and Column References

> *olist_customers_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| customer_id                   | object    |
| customer_unique_id            | object    |
| customer_zip_code_prefix      | int64     |
| customer_city                 | object    |
| customer_state                | object    |

> *olist_order_items_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| order_id                      | object    |
| order_item_id                 | int64     |
| product_id                    | object    |
| seller_id                     | object    |
| shipping_limit_date           | object    |
| price                         | float64   |
| freight_value                 | float64   |

> *olist_order_payments_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| order_id                      | object    |
| payment_sequential            | int64     |
| payment_type                  | object    |
| payment_installments          | int64     |
| payment_value                 | float64   |

> *olist_order_reviews_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| review_id                     | object    |
| order_id                      | object    |
| review_score                  | int64     |
| review_comment_title          | object    |
| review_comment_message        | object    |
| review_creation_date          | object    |
| review_answer_timestamp       | object    |

> *olist_orders_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| order_id                      | object    |
| customer_id                   | object    |
| order_status                  | object    |
| order_purchase_timestamp      | object    |
| order_approved_at             | object    |
| order_delivered_carrier_date  | object    |
| order_delivered_customer_date | object    |
| order_estimated_delivery_date | object    |

> *olist_products_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| product_id                    | object    |
| product_category_name         | object    |
| product_name_lenght           | float64   |
| product_description_lenght    | float64   |
| product_photos_qty            | float64   |
| product_weight_g              | float64   |
| product_length_cm             | float64   |
| product_height_cm             | float64   |
| product_width_cm              | float64   |

> *olist_sellers_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| seller_id                     | object    |
| seller_zip_code_prefix        | int64     |
| seller_city                   | object    |
| seller_state                  | object    |

> *olist_geolocation_dataset.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| geolocation_zip_code_prefix   | int64     |
| geolocation_lat               | float64   |
| geolocation_lng               | float64   |
| geolocation_city              | object    |
| geolocation_state             | object    |

> *product_category_name_translation.csv*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| product_category_name         | object    |
| product_category_name_english | object    |
