
# Manage Data for an Online Grocer Using MySQL Workbench

Date: March 13, 2025 Author: Vesela Velikova

#### Table of Contents
- <a href="#project-scenario" id="toc-project-scenario">Project Scenario</a>
- <a href="#database-design-and-creation" id="toc-database-design-and-creation">Database Design and Creation</a>
  - <a href="#mysql-model" id="toc-mysql-model">MySQL Model</a>
  - <a href="#extended-entity-relationship-diagram-(eer)" id="toc-extended-entity-relationship-diagram-eer">Extended Entity-Relationship diagram (EER)</a>
  - <a href="#a-database-schema" id="toc-a-database-schema">A database schema</a>
  - <a href="#creating-tables" id="toc-creating-tables">Creating tables</a>
- <a href="#database-testing" id="toc-database-testing">Database Testing</a>
- <a href="#insights-and-conclusions" id="toc-insights-and-conclusions">Insights and Conclusions</a>

## **Project Scenario**

Greenspot Grocer is a small, family-owned online grocery store that is growing rapidly and planning a major expansion. Their product data is currently stored in a spreadsheet format. In order to accommodate their growing inventory they need a relational database.
**MySQL Workbench** is used in order to model the database.

The company is providing [sample data](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/csv-files/GreenspotDataset.csv) in spreadsheet format.

![Screenshot of Original Table Greenspot Dataset](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Original%20Table%20Greenspot%20Dataset.jpg)

On first glance we can see that:
 - **Limited data**. The dataset is small and limited to one month of sales.
 - **Data format errors**. In date, price, cost columns there are date format errors. 
 - **Missing values**. I found some missing data regarding orders, customer information
 - **Inconsistencies**. In Location and Unit columns: D12 and d12, 12-oz can and 12 ounce can, etc.
After examination, organization and some cleaning of data, we can see that the table stores information about **products, inventory and storage, orders and customers**.

![Screenshot of Greenspot Data](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Greenspot%20data.jpg)  

The next step I took is to organize the data into different tables for easier data entry (this step is suitable for the current case, but if we have more data it is not efficient). These tables will be used in order to model a database and generate an Extended Entity-Relationship diagram (EER). And then proceeded with the creation of the Dataset Model.

## **Database Design and Creation**

I used **MySQL Workbench** to model a database and generate **EER (Extended Entity-Relationship diagram)**. After I generated the EER the **Forward engineer** menu is used to generate the **Greenspot dataset**.


#### **MySQL Model**

![Screenshot of MySQL model Greenspot dataset](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/MySQL%20Model%20Greenspot%20Dataset.jpg) 

#### **Extended Entity-Relationship diagram (EER)**

![Screenshot of EER](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/EER.png) 

#### **A database schema**

![Screenshot of database schema](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Greenspot%20schema.jpg) 

### **Creating tables**

**Products table** includes columns productID *int* (**primary key**), description *varchar(45)*, vendor *varchar(100)*, productType *varchar(45)*, location *varchar(45)*, unit *varchar(45)*.

![Screenshot of products table](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Product%20table.jpg)

**Inventory table** with the following columns: inventoryNum *int* (**Primary key**), productNumber *int* (**Foreign key**), quantityInStock *int*, purchaseDate *date*, purchaseCost *decimal(4,2)*.

![Screenshot of inventory table](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Inventory%20table.jpg)

**Orders table** with columns orderID *int*(**Primary key**), salePrice *decimal(4,2)*, saleDate *date*, quantitySold *int*, customerID *int* (**Foreign key**), productNumOrd *int*.

![Screenshot of orders table](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Orders%20table.jpg)

**Customer table** that includes columns customerID *int* (**Primary key**) and customerName *varchar(45)* (names of the customers were not provided).

![Screenshot of customers table](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Customers%20table.jpg)


## **Database Testing**

In this section I will demonstrate several [SQL queries](https://github.com/veselaDV/greenspot-grocer-dataset/tree/main/sql-queries) to test the relationships between tables. 
In addition I will answer the following questions:


Investigating **inventory levels** and **cost per product**. What are the levels of our inventory by product? What is the cost of the products? Are there products with insufficient stock?


![Screenshot of inventory levels query](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Inventory%20levels%20and%20inventory%20cost%20query.jpg)


What are the total **revenue**, total **products sold** and total **orders** for the month of February?

	
![Screenshot of revenue sales orders](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Total%20revenue%20sales%20orders.jpg)	


Which are the top 3 best performing products? 
**Top 3** products with the **highest revenue**.


![Screenshot of top 3 highest revenue](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Top%203%20products%20by%20revenue.jpg)	


**Top 3** products with the **most sales**.


![Screenshot of top 3 most sales](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Top%203%20products%20by%20sales.jpg)	


**Profit** per product. Here I calculate the difference between sale and cost prices for each product. The products with numbers 1000 and 1223 are duplicated because of the change of sale price during the period.

	
![Screenshot of profit](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Profit%20per%20product.jpg)	


Which is the ** top customer** with the highest number of orders?

	
![Screenshot of top customer](https://github.com/veselaDV/greenspot-grocer-dataset/blob/main/screenshots/Customers%20ranking.jpg)
	

## **Insights and Conclusions**

The original dataset had several issues (inconsistent data, formatting data errors, missing data). With the creation and utilization of the database design we addressed the potential problems with the collection and analysis of the data that the company was facing. Implementation of the dataset in everyday work of the Greenspot Grocer Company should increase the integrity of the collected data. In addition the company can benefit by extending the information it collects with data regarding customer information, shipping data (if sales are made online), product ratings.