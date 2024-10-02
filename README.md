# Radcom_assign
Grafana Dashboard Automation with Robot Framework
This project demonstrates an automated system that tests data visibility in a Grafana dashboard. We use Robot Framework for automation, MariaDB as the data source, and Grafana for visualizing the data.

Steps Completed
Kubernetes Setup:

We have deployed Grafana and MariaDB on a local Kubernetes cluster (Docker Desktop was used for the Kubernetes environment).
Both services were defined using YAML files (mariadb-deployment.yaml and grafana-deployment.yaml).
After deploying these services using kubectl apply -f, the services were running and available for interaction.
Data Loading into MariaDB:

The project includes a Robot Framework automation script that loads data into a table in MariaDB.
The script connects to MariaDB and inserts predefined test data for the validation process.
Grafana Configuration:

After loading the data into MariaDB, the automation script connects to Grafana.
We configured Grafana’s data source to use MariaDB, and we set up a Timeseries dashboard that pulls the inserted data for visualization.
Data Validation:

Once the Grafana dashboard is set up, the next step is to validate that the correct data is visible.
For this, the Robot Framework script takes a screenshot of the Grafana dashboard and compares it to an expected screenshot to ensure the data visualization is accurate.
Current Status on Bonus Steps:

We have started working on the bonus part which involves wrapping the Robot Framework automation into a container and exposing an API using FastAPI. This is currently a work-in-progress, and only some of the tasks are partially done.
![image](https://github.com/user-attachments/assets/f4fd6ad3-ad58-429b-8e33-a4ae392f6c70)
