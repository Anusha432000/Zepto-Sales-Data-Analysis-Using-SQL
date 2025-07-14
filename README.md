# 📊 Zepto Sales Data Analysis Using SQL (PostgreSQL)

This project explores and analyzes product-level data from **Zepto**, a fast-commerce grocery delivery service, using **PostgreSQL**. The aim is to derive meaningful business insights using SQL queries — from pricing and discounts to inventory and revenue.

---

## 🗂️Zepto Inventory Dataset
https://www.kaggle.com/datasets/palvinder2006/zepto-inventory-dataset

---

## 📌 Project Overview

In this project, we explore sales and inventory-related data and answer key business questions such as:
- Which products offer the best value?
- What’s the estimated revenue by category?
- Are high-MRP products going out of stock?
- What’s the price efficiency per gram of product?

All of these are done using structured SQL queries executed in **pgAdmin** with **PostgreSQL**.

---

## 🧱 Database Schema

**Table: `zepto`**

| Column Name             | Data Type           | Description                           |
|------------------------|---------------------|---------------------------------------|
| `sku_id`               | SERIAL PRIMARY KEY  | Unique identifier                     |
| `category`             | VARCHAR(120)        | Product category                      |
| `name`                 | VARCHAR(150) NOT NULL | Product name                        |
| `mrp`                  | NUMERIC(8,2)         | Maximum Retail Price                  |
| `discountPercentage`   | NUMERIC(5,2)         | Discount offered                      |
| `availableQuantity`    | INTEGER              | Quantity available                    |
| `discountedSellingPrice` | NUMERIC(8,2)       | Selling price after discount          |
| `weightInGms`          | INTEGER              | Product weight in grams               |
| `outOfStock`           | BOOLEAN              | Product availability status           |
| `quantity`             | INTEGER              | Total units in inventory              |

---

## ❓ SQL Business Questions

1. ✅ Find the top 10 best-value products based on the discount percentage.
2. ✅ What are the products with **high MRP but out of stock**?
3. ✅ Calculate **estimated revenue per category**.
4. ✅ Find all products where **MRP > ₹500 and discount < 10%**.
5. ✅ Identify the **top 5 categories** offering the **highest average discount percentage**.
6. ✅ Find the **price per gram** for products above **100g** and sort by best value.
7. ✅ Categorize products into buckets like **Low**, **Medium**, and **Bulk** based on weight.
8. ✅ Calculate the **total inventory weight** per category.
9. ✅ Analyze the ratio of **in-stock vs out-of-stock** products.

---

## 📈 Key Insights

- High-discount products are mostly in snack and personal care categories.
- Several products with **high MRP** are still **out of stock**, indicating possible supply chain issues.
- The **beverages** and **dairy** categories generate the most estimated revenue.
- Products above 100g with the **lowest price per gram** provide great value and should be promoted.
- Inventory weight is concentrated in categories like **rice**, **oils**, and **frozen items**.


---

## 👤 Author

**Anusha P**  
📍 Hyderabad, Telangana  
🔗 [LinkedIn] https://www.linkedin.com/in/anushapagadala 
✉️pagadalaanusha@gmail.com*
