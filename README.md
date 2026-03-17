
# Supplier-to-Customer Analytics
**Advanced SQL Analytics for Retail & Supply Chain Management**

##  Project Overview
This project demonstrates the application of MySQL to solve real-world business problems in a retail environment. It covers a wide range of SQL concepts from basic data retrieval to intermediate techniques like Multi-table Joins, View creation, and Window Functions (RANK) to analyze customer behavior, supplier performance, and sales trends.

##  Tech Stack & Key Concepts
* **Database:** MySQL
* **Core Concepts Used:**
    * **Data Aggregation:** Group By and Having clauses for country-wise and monthly analysis.
    * **Complex Joins:** Inner and Left Joins to connect Customers, Orders, Products, and Suppliers.
    * **Business Logic:** Analyzing revenue, identifying costliest items, and discontinued products.
    * **Data Modeling:** Handling relational data between 5 interconnected tables.
    * **Advanced Features:** View creation and Window Functions (RANK()) for competitive supplier analysis.

## 🚀 Key Business Questions Addressed
- **Customer Insights:** Identifying customer distribution by country (e.g., Mexico).
- **Sales Trends:** Monthly and yearly order volume tracking to identify peak seasons.
- **Supplier Performance:** Finding top suppliers by product count and total revenue.
- **Competitor Analysis:** Identifying top-selling products and their market competitors.
- **Inventory Tracking:** Filtering active vs. discontinued products.

##  Repository Structure
* `MySQL_Project_Script.sql`: The complete SQL script containing all queries and logic.
* `Schema_Documentation.md`: (Optional) Brief description of the table relationships.

##  Sample Analytics Performed
- Top 2 suppliers per country using `RANK()` function.
- View creation for real-time sales monitoring by supplier.
- Identifying high-revenue products using multi-table aggregation.

Queries
- `SELECT * FROM table_name;` - Retrieve all records from a table
- `INSERT INTO table_name (column1, column2) VALUES ('value1', 'value2');` - Insert a new record
- `UPDATE table_name SET column1 = 'new_value' WHERE condition;` - Update existing records
- `DELETE FROM table_name WHERE condition;` - Delete records
- `SELECT * FROM table1 INNER JOIN table2 ON table1.id = table2.id;` - Inner join example

