#!/bin/bash

#
# Run tangara-evaluation
#
# Process data from the last 12 hours, and execute this script every 12 hours
# to report data from the last 12 hours since the current datetime.
#

echo "Running Tangara Last 12 Hours Evaluation ..."

# Define datetime interval to last 12h from now
START_ISO8601_DATETIME=$(TZ='America/Bogota' date --date='12 hour ago' --iso-8601=seconds)
END_ISO8601_DATETIME=$(TZ='America/Bogota' date --iso-8601=seconds)
echo 'START_ISO8601_DATETIME: '$START_ISO8601_DATETIME
echo 'END_ISO8601_DATETIME: '$END_ISO8601_DATETIME
echo ''

# Update .env file with new datetime interval
sed -i~ "/^START_ISO8601_DATETIME=/s/=.*/="$START_ISO8601_DATETIME"/" src/.env
sed -i~ "/^END_ISO8601_DATETIME=/s/=.*/="$END_ISO8601_DATETIME"/" src/.env

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
