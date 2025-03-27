{% test is_datetime(model, column_name) %}

WITH validation AS (
    SELECT
        {{ column_name }} AS value
    FROM {{ model }}
    WHERE 
        -- Ignore NULL values and check only non-null entries
        {{ column_name }} IS NOT NULL
        AND SAFE_CAST({{ column_name }} AS TIMESTAMP) IS NULL
)

SELECT * FROM validation

{% endtest %}
