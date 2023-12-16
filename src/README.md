# Tangara Evaluation
The Tangara Evaluation is an easy way to evaluate Tangara's sensors by comparing them through a time series, identifying missing data, detecting outliers, and assessing offline sensors. This version is a brief solution using Jupyter Notebooks, Python, and Bash scripts to generate output data from data sources provided by Air Quality sensors in Cali, Colombia. https://tangara.chis.pa/

## Data
Read more [README.md](data/README.md)

## Notebooks
Read more [README.md](notebooks/README.md)

## Scripts
Read more [README.md](scripts/README.md)

## Documentation
Read more [README.md](docs/README.md)

## Environment Variables

Please setup each environment variable value before execute any script or notebook:

Create a new **.env** file inside the **src** directory and use the environment variables as you can see in the **example.env** file just change the values. This file will be ignored and never will be committed to the repository.

The environement variables below are required:

* URL_INFLUXDB_QUERY_ENDPOINT=http://influxdb.example:8080/query
* DB_NAME_INFLUXDB=my_database
* PLOT_CHARTS=
* GROUP_BY_TIME=30s
* START_ISO8601_DATETIME=2023-03-17T00:00:00-05:00
* END_ISO8601_DATETIME=2023-03-17T00:00:00-05:00

**GROUP_BY_TIME** allowed values: **30s**, **1m**, **1h**

When are you using 30s the raw data collected from InfluxDB will be the last value every 30 seconds, if you use another value 1m or 1h the raw data collected from InfluxDB will be the mean value every 1 minute or every 1 hour.

**PLOT_CHARTS**: allowed values: **True**, **''**

If you want to skip the Plot Charts process because it takes a long time to finish, leave it empty to skip or 'True' otherwise.
