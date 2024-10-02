*** Settings ***
Library    DatabaseLibrary
Library    grafana_api.grafana.Grafana

*** Variables ***
${DB_HOST}     mariadb
${DB_USER}     root
${DB_PASSWORD} password
${DB_NAME}     testdb

*** Test Cases ***
Insert Data into MariaDB
    Connect To Database  pymysql  ${DB_HOST}  ${DB_USER}  ${DB_PASSWORD}  ${DB_NAME}
    Execute Sql  INSERT INTO mytable (timestamp, value) VALUES ('2023-01-01 12:00:00', 100)
    Disconnect From Database

Configure Grafana Datasource
    Connect to Grafana  http://localhost:3000
    Login to Grafana  admin  admin
    Add MariaDB DataSource  ${DB_HOST}  ${DB_NAME}  ${DB_USER}  ${DB_PASSWORD}

Create Dashboard and Panel
    Create Dashboard  Test Dashboard
    Create Timeseries Panel  Test Panel  SELECT timestamp, value FROM mytable
*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}    http://localhost:3000
${USERNAME}    admin
${PASSWORD}    admin
${EXPECTED_SCREENSHOT}    expected_dashboard.png

*** Test Cases ***
Validate Grafana Dashboard
    Open Browser    ${URL}    chrome
    Maximize Browser Window
    Input Text    username    ${USERNAME}
    Input Text    password    ${PASSWORD}
    Click Button    Log in
    Sleep    5s    # wait for Grafana to load
    Capture Page Screenshot    actual_dashboard.png
    Close Browser
    Compare Screenshots    actual_dashboard.png    ${EXPECTED_SCREENSHOT}

*** Keywords ***
Compare Screenshots
    [Arguments]    ${actual}    ${expected}
    ${result}    Run Keyword And Return Status    Should Be Equal As Strings    ${actual}    ${expected}
    Run Keyword If    not ${result}    Fail    Screenshot comparison failed.
