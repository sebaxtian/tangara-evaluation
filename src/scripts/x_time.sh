#!/bin/bash

#
# Run tangara-evaluation
#
# Process data since the START_ISO8601_DATETIME environment variable value,
# to END_ISO8601_DATETIME environment variable value
#
# Please, read the src/README.md file for details.
#

echo "Running Tangara Evaluation ..."

# Define datetime interval
START_ISO8601_DATETIME=$(awk -F= -v key="START_ISO8601_DATETIME" '$1==key {print $2}' src/.env)
END_ISO8601_DATETIME=$(awk -F= -v key="END_ISO8601_DATETIME" '$1==key {print $2}' src/.env)
echo 'START_ISO8601_DATETIME: '$START_ISO8601_DATETIME
echo 'END_ISO8601_DATETIME: '$END_ISO8601_DATETIME
echo ''

# Run Tangara Stations
echo 'Running Tangara Stations ...'
jupyter nbconvert --execute --to notebook --inplace src/notebooks/tangaras.ipynb &>/dev/null
echo '... OK'
echo ''

# Run Temperature Raw Data
echo 'Running Temperature Raw Data ...'
jupyter nbconvert --execute --to notebook --inplace src/notebooks/temp_raw.ipynb &>/dev/null
echo '... OK'
echo ''

# Run Humidity Raw Data
echo 'Running Humidity Raw Data ...'
jupyter nbconvert --execute --to notebook --inplace src/notebooks/hum_raw.ipynb &>/dev/null
echo '... OK'
echo ''

# Run PM2.5 Raw Data
echo 'Running PM2.5 Raw Data ...'
jupyter nbconvert --execute --to notebook --inplace src/notebooks/pm25_raw.ipynb &>/dev/null
echo '... OK'
echo ''

# Run PM2.5 Clean Data
echo 'Running PM2.5 Clean Data ...'
jupyter nbconvert --execute --to notebook --inplace src/notebooks/pm25_clean.ipynb &>/dev/null
echo '... OK'
echo ''

# Run PM2.5 to AQI
echo 'Running PM2.5 to AQI ...'
jupyter nbconvert --execute --to notebook --inplace src/notebooks/pm25_to_aqi.ipynb &>/dev/null
echo '... OK'
echo ''

echo "Finished !!"
