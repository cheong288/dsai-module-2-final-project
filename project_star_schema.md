### Fact Tables

> *fact_orders*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| customer_id                   | object    |
| order_id                      | object    |
| payment_value                 | float64   |
| payment_type                  | object    |

> *fact_order_items*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| customer_id                   | object    |
| order_id                      | object    |
| order_item_id                 | int64     |
| product_id                    | object    |
| seller_id                     | object    |
| price                         | float64   |
| freight_value                 | float64   |
| order_approved_at             | object    |
| order_purchase_timestamp      | object    |
| order_delivered_customer_date | object    |
| order_estimated_delivery_date | object    |


### Dimension Tables

> *dim_customer*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| customer_id                   | object    |
| customer_unique_id            | object    |
| customer_zip_code_prefix      | int64     |
| customer_city                 | object    |
| customer_state                | object    |

> *dim_product*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| product_id                    | object    |
| product_category_name         | object    |

> *dim_seller*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| seller_id                     | object    |
| seller_zip_code_prefix        | int64     |
| seller_city                   | object    |
| seller_state                  | object    |

> *dim_geolocation*

| Column Name                   | Data Type |
|-------------------------------|-----------|
| geolocation_zip_code_prefix   | int64     |
| geolocation_city              | object    |
| geolocation_state             | object    |


