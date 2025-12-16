# Zepto-project-DA

Zepto Product, Pricing & Inventory Analysis

📌 Project Overview

This project analyzes product pricing, discount strategies, and inventory availability for a quick-commerce platform (Zepto). The analysis was carried out using MySQL for data cleaning and querying, and Power BI for building an interactive dashboard to derive business insights.

🎯 Objectives

Analyze product distribution across categories

Compare MRP and selling prices

Identify high-discount products

Evaluate stock availability and low-stock items

Visualize insights using Power BI

🧰 Tools & Technologies

MySQL – Data cleaning, transformation, and analysis

Power BI – Interactive dashboard and data visualization

SQL – Aggregations, filtering, and views

📂 Dataset Description

The dataset contains product-level information including:

Category

Product Name

MRP

Discounted Selling Price

Discount Percentage

Available Quantity

Stock Status

Product Weight

🧹 Data Cleaning (SQL)

Removed products with invalid pricing (MRP = 0)

Identified inconsistent selling prices

Verified stock availability

DELETE FROM zepto_v2
WHERE mrp = 0;

📊 Key SQL Analysis
-- Category-wise product count
SELECT Category, COUNT(*) AS product_count
FROM zepto_v2
GROUP BY Category
ORDER BY product_count DESC;

-- Average MRP vs Average Selling Price
SELECT 
    AVG(mrp) AS avg_mrp,
    AVG(discountedSellingPrice) AS avg_selling_price
FROM zepto_v2;

-- In-stock vs Out-of-stock products
SELECT 
    CASE 
        WHEN outOfStock = 'TRUE' THEN 'Out of Stock'
        ELSE 'In Stock'
    END AS stock_status,
    COUNT(*) AS product_count
FROM zepto_v2
GROUP BY stock_status;

-- High discount products (>40%)
SELECT name, Category, discountPercent
FROM zepto_v2
WHERE discountPercent > 40
ORDER BY discountPercent DESC;

📈 Power BI Dashboard

The Power BI dashboard includes:

KPI cards for total products, average MRP, average selling price, and average discount

Category-wise product distribution (Clustered Bar Chart)

Average discount by category

In-stock vs out-of-stock analysis (Pie Chart)

High-discount products table

(Dashboard screenshots can be found in the screenshots folder)

🔍 Key Insights

Products are sold at prices significantly lower than MRP, indicating strong discount strategies

Certain categories contribute the highest number of products

A portion of products remain out of stock, highlighting restocking opportunities

High discounts are concentrated in specific categories

✅ Conclusion

This project demonstrates an end-to-end data analysis workflow using SQL and Power BI, showcasing data cleaning, business-oriented analysis, and interactive visualization to support decision-making.
