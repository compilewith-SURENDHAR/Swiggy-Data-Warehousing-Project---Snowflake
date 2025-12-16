# Swiggy Data Warehousing Project using Snowflake

This project demonstrates the design and implementation of an end-to-end data warehouse for a food delivery platform (Swiggy-like use case) using Snowflake.
The goal is to ingest raw data, transform it into analytics-ready structures, and enable business reporting using dimensional modeling (star schema).

## what this involves:
* Design a scalable data warehouse architecture
* Ingest raw CSV data into Snowflake
* Transform and standardize data for analytics
* Build dimension and fact tables using a star schema
* Enable business reporting through KPI views

## Key Concepts Demonstrated
-> Data warehousing architecture <br>
-> Snowflake stages and streams <br>
-> Incremental loading with MERGE <br>
-> Dimensional modeling (facts & dimensions) <br>
-> SCD Type 2 implementation <br>
-> Analytical view design <br>

## Data Modeling
**Star Schema** – Consumption Layer <br>
**Fact Table**: order_item_fact <br>
Grain: one row per order item <br>
Measures: quantity, price, subtotal <br>

**Dimension Tables**:
1. customer_dim
2. customer_address_dim
3. restaurant_dim
4. restaurant_location_dim
5. menu_dim
6. delivery_agent_dim
7. date_dim
<img width="800" height="500" alt="starschema" src="https://github.com/user-attachments/assets/dbfc130a-f260-48fd-b230-06af1588217e" />

