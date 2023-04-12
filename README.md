
# Sales Management

### Business Request

The business request for this data analyst project was an executive sales report for sales managers.

- We need to improve our internet sales reports and want to move from static reports to visual dashboards.

- We want to focus it on how much we have sold of what products, to which clients and how it has been over time.

- They included the budget (spreadsheet) to compare the values against performance.

- The budget is for 2021 and we usually look 2 years back in time when we do the analysis of sales.


### Tools I used in this project

- Microsoft SQL Server 

- Power BI

### Data Cleansing & Transformation (SQL)

To create the necessary data model for doing analysis and fulfilling the business needs defined in the user stories the following tables were extracted using SQL.

One data source (sales budgets) were provided in Excel format and were connected in the data model in a later step of the process.

Below the link are the SQL statements for cleansing and transforming necessary data.

[**SQL Code**](https://github.com/rejoice03/Sales-Management/blob/main/Sales%20Management.sql)

### Data Model

Below is a screenshot of the data model after cleansed and prepared tables were read into Power BI.

This data model also shows how FACT_Budget hsa been connected to FACT_InternetSales and other necessary DIM tables.







![App Screenshot](https://github.com/rejoice03/Sales-Management/blob/main/Data%20Model.png?raw=true)

### Sales Management Dashboard

The finished sales management dashboard with one page with works as a dashboard and overview, with two other pages focused on combining tables for necessary details and visualizations to show sales over time, per customers and per products.

[**Power BI Link Click here**](https://app.powerbi.com/view?r=eyJrIjoiZWFhNDBjNjYtYzAwYy00M2Y5LWE4Y2EtOWM2NWM0Y2YxODI5IiwidCI6ImZmODI2ZWQyLTkyYmYtNDJjMC1iZDY4LTIwZjhmMDQyYjljZSJ9)


![App Screenshot](https://github.com/rejoice03/Sales-Management/blob/main/Sales%20Overview.png?raw=true)


