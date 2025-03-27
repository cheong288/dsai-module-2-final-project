```sh
#!/bin/bash

# Set environment variables (if needed)
# export DBT_PROFILES_DIR="/path/to/your/dbt/profiles"

# Debug dbt setup
echo "Running dbt debug..."
dbt debug || { echo "dbt debug failed"; exit 1; }

echo "Running dbt seed..."
dbt seed || { echo "dbt seed failed"; exit 1; }

echo "Running dbt run..."
dbt run || { echo "dbt run failed"; exit 1; }

echo "Running dbt test..."
dbt test || { echo "dbt test failed"; exit 1; }

echo "Starting Jupyter Notebook..."
jupyter notebook

```
