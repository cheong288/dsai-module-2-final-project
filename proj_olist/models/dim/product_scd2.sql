--    `final-project-57294.ds_olist.test_product`

{{ config(
    materialized='incremental',
    unique_key=['product_id', 'start_date'],
    schema = 'dim'
) }}

WITH source AS (
    SELECT
        product_id,
        product_category_name,
        start_date
    FROM `final-project-57294.ds_olist.test_product`
),

{% if is_incremental() %}
existing AS (
SELECT *
FROM {{ this }} -- Use the current table instead of self-referencing
WHERE is_current = TRUE
),
{% else %}
existing AS (
SELECT
  CAST(NULL AS STRING) AS product_id,
  CAST(NULL AS STRING) AS product_category_name,
  CAST(NULL AS TIMESTAMP) AS start_date,
  CAST(NULL AS TIMESTAMP) AS end_date,
  CAST(NULL AS BOOLEAN) AS is_current
--FROM (SELECT 1 WHERE 1=0) AS dummy_table
),
{% endif %}

changes AS (
    SELECT
        s.product_id,
        s.product_category_name,
        TIMESTAMP(s.start_date) AS start_date,
        TIMESTAMP('9999-12-31') AS end_date,
        TRUE AS is_current
    FROM source s
    LEFT JOIN existing e
        ON s.product_id = e.product_id
        AND TIMESTAMP(s.start_date) = TIMESTAMP(e.start_date)
    WHERE e.product_id IS NULL OR s.product_category_name <> e.product_category_name
),

updates AS (
    SELECT
        e.product_id,
        e.product_category_name,
        e.start_date,
        TIMESTAMP_SUB(c.start_date, INTERVAL 1 DAY) AS end_date,
        FALSE AS is_current
    FROM existing e
    JOIN changes c
        ON e.product_id = c.product_id
    WHERE e.is_current = TRUE
),

final AS (
    SELECT e.product_id, e.product_category_name, e.start_date, e.end_date, e.is_current
    FROM existing e
    LEFT JOIN updates u
        ON e.product_id = u.product_id
        AND TIMESTAMP(e.start_date) = TIMESTAMP(u.start_date)
    WHERE u.product_id IS NULL  -- Exclude updated records
    UNION ALL
    SELECT product_id, product_category_name, start_date, end_date, is_current FROM updates
    UNION ALL
    SELECT product_id, product_category_name, start_date, end_date, is_current FROM changes
)

SELECT
    product_id,
    product_category_name,
    start_date,
    end_date,
    is_current
FROM final

