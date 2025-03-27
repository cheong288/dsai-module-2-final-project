{% macro test_is_integer(model, column_name) %}

WITH validation AS (
    SELECT 
        {{ column_name }} AS value,
        SAFE_CAST({{ column_name }} AS INT64) AS casted_value
    FROM {{ model }}
    WHERE {{ column_name }} IS NOT NULL  -- Exclude NULL values
)
SELECT value 
FROM validation
WHERE value != casted_value  -- Find non-integer values

{% endmacro %}
