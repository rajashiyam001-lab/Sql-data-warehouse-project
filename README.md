# Sql-data-warehouse-project
Construction d’un entrepôt de données moderne avec Microsoft SQL Server, incluant le processus ETL, la modélisation des données et l’analytique.

# 📊 Data Warehouse Project – Medallion Architecture (Bronze | Silver | Gold)

## 📖 Overview

This project demonstrates the design and implementation of a modern **data warehouse** using **SQL Server** and the **Medallion Architecture (Bronze, Silver, Gold)**.

It covers the full data lifecycle from raw ingestion to business-ready analytics, including ETL pipelines, data modeling, and reporting layers.

---

## 🏗️ Architecture

The project follows the **Medallion Architecture**:

- 🥉 **Bronze Layer**  
  Raw data ingestion from source systems (CRM & ERP CSV files).

- 🥈 **Silver Layer**  
  Cleaned, standardized, and transformed data ready for analysis.

- 🥇 **Gold Layer**  
  Business-ready data modeled into **star schema (facts & dimensions)** for reporting and analytics.

---

## 🔄 Data Pipeline

The data flow follows these steps:

1. **Extract** data from CRM and ERP CSV files  
2. **Load** raw data into Bronze tables  
3. **Transform** and clean data in Silver layer  
4. **Model** data into analytical structures in Gold layer  
5. **Query & Analyze** using SQL views

---

## 🎯 Project Objectives

The main goal of this project is to build a scalable data warehouse that enables:

- Centralized storage of sales data  
- Data cleansing and quality improvements  
- Integration of multiple data sources  
- Analytical reporting and decision-making  

---

## ⚙️ Technical Stack

- SQL Server  
- T-SQL (Stored Procedures, Views, ETL scripts)  
- CSV Data Sources (ERP & CRM systems)  
- Data Warehousing Concepts  
- Medallion Architecture  

---

## 📌 Key Features

- ETL pipeline using SQL stored procedures  
- Data cleansing and standardization  
- Slowly evolving clean dataset (latest snapshot only)  
- Star schema design in Gold layer  
- Business-ready SQL views for reporting  

---

## 📊 Data Modeling (Gold Layer)

The Gold layer contains a **Star Schema**:

### Dimensions:
- `dim_customers`
- `dim_products`

### Fact Table:
- `fact_sales`

These models are optimized for analytical queries and reporting performance.

---

## 📁 Data Sources

- CRM System (Customer & Sales Data)
- ERP System (Product & Category Data)

Provided as flat CSV files.

---

## 🧹 Data Quality Handling

The project includes multiple data quality improvements:

- Removal of duplicates
- Standardization of text fields
- Handling missing values
- Data type corrections
- Business rule validations

---

## 🚀 How to Run

1. Run Bronze layer scripts (data ingestion)
2. Execute Silver stored procedure:
   ```sql
   EXEC silver.load_silver;
