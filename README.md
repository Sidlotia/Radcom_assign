Grafana Dashboard Automation with Robot Framework
This project demonstrates an automated system that tests data visibility in a Grafana dashboard. We use Robot Framework for automation, MariaDB as the data source, and Grafana for visualizing the data. Additionally, a Python project is used for handling certain parts of the automation, including data loading into MariaDB.

Steps Completed
Kubernetes Setup:

We have deployed Grafana and MariaDB on a local Kubernetes cluster (Docker Desktop was used for the Kubernetes environment).
Both services were defined using YAML files (mariadb-deployment.yaml and grafana-deployment.yaml).
After deploying these services using kubectl apply -f, the services were running and available for interaction.
Python Project for Data Loading:

A simple Python project was created that interacts with MariaDB.
The Python script connects to the MariaDB database, creates a table, and inserts known test data into the table.
This data is later used in the Grafana dashboard for visualization.
Here’s an overview of the Python project structure:

graphql
Copy code
python_project/
├── data_loader.py    # Script to connect to MariaDB and insert data
├── requirements.txt  # List of dependencies (e.g., pymysql)
└── __init__.py       # Module initialization
The data_loader.py contains logic to:

Connect to MariaDB using PyMySQL.
Create a table if it doesn’t exist.
Insert predefined data into the table.
Running the Python project: To run the data loading script, navigate to the python_project/ directory and run:

bash
Copy code
python data_loader.py
Data Loading into MariaDB (Robot Framework):

While the Python script handles the initial database setup, Robot Framework also provides an alternative method for loading data into MariaDB using the DatabaseLibrary plugin.
The db_data_insertion.robot file handles the automation of data loading, ensuring MariaDB contains the necessary data for Grafana.
Grafana Configuration:

After loading the data into MariaDB, the Robot Framework script connects to Grafana.
We configured Grafana’s data source to use MariaDB, and we set up a Timeseries dashboard that pulls the inserted data for visualization.
Data Validation:

Once the Grafana dashboard is set up, the next step is to validate that the correct data is visible.
For this, the Robot Framework script takes a screenshot of the Grafana dashboard and compares it to an expected screenshot to ensure the data visualization is accurate.
Current Status on Bonus Steps:

We have started working on the bonus part which involves wrapping the Robot Framework automation into a container and exposing an API using FastAPI. This is currently a work-in-progress, and only some of the tasks are partially done.
