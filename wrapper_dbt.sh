#!/bin/bash

# Load Conda environment properly
source /home/luser/miniconda3/etc/profile.d/conda.sh
conda activate dwh

# Change to the project directory
cd /home/luser/DS/course/Projects/dsai-module-2-final-project/proj_olist || { echo "Directory not found"; exit 1; }

# Run dbt seed
echo "Running dbt seed..."
dbt seed  > /home/luser/wrapper_dbt.log 2>&1

# Check if dbt seed was successful
if [ $? -eq 0 ]; then
    echo "dbt seed successful. Running dbt run..."
    mv  /home/luser/DS/course/Projects/dsai-module-2-final-project/proj_olist/seeds/*.csv  /home/luser/DS/course/Projects/dsai-module-2-final-project/proj_olist/seeds/backup/
    echo " All csv files moved to backup folder"
    dbt run >> /home/luser/wrapper_dbt.log 2>&1
    echo "dbt run completed."
else
    echo "dbt seed failed. Check dbt_seed.log for details."
    exit 1
fi


