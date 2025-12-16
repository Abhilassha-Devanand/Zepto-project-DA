use zep;

show tables;

select * from zepto_v2;

SELECT COUNT(*) AS total_products
FROM zepto_v2;

SELECT Category, COUNT(*) AS product_count
FROM zepto_v2
GROUP BY Category
ORDER BY product_count DESC;

SELECT *
FROM zepto_v2
WHERE mrp = 0;

SELECT name, mrp, discountedSellingPrice
FROM zepto_v2
WHERE discountedSellingPrice > mrp;

SELECT 
    AVG(mrp) AS avg_mrp,
    AVG(discountedSellingPrice) AS avg_selling_price
FROM zepto_v2;

SELECT 
    Category,
    ROUND(AVG(mrp), 2) AS avg_mrp,
    ROUND(AVG(discountedSellingPrice), 2) AS avg_selling_price
FROM zepto_v2
GROUP BY Category;

SELECT name, Category, mrp
FROM zepto_v2
ORDER BY mrp DESC
LIMIT 10;

SELECT name, Category
FROM zepto_v2
WHERE outOfStock = 'TRUE';

SELECT 
    Category,
    COUNT(*) AS out_of_stock_count
FROM zepto_v2
WHERE outOfStock = 'TRUE'
GROUP BY Category;

SELECT name, Category, availableQuantity
FROM zepto_v2
WHERE availableQuantity < 10
ORDER BY availableQuantity ASC;

SELECT 
    Category,
    SUM(availableQuantity) AS total_stock
FROM zepto_v2
GROUP BY Category
ORDER BY total_stock DESC;

SELECT 
    name,
    mrp,
    discountedSellingPrice,
    (mrp - discountedSellingPrice) AS discount_amount
FROM zepto_v2
WHERE mrp > 0;

SELECT name, Category, discountPercent
FROM zepto_v2
WHERE discountPercent > 40
ORDER BY discountPercent DESC;

SELECT 
    name,
    weightInGms,
    discountedSellingPrice,
    ROUND(discountedSellingPrice / weightInGms, 2) AS price_per_gram
FROM zepto_v2
WHERE weightInGms > 0
ORDER BY price_per_gram ASC;

SELECT 
    Category,
    ROUND(AVG(discountedSellingPrice / weightInGms), 2) AS avg_price_per_gram
FROM zepto_v2
WHERE weightInGms > 0
GROUP BY Category;

SELECT name, Category
FROM zepto_v2
WHERE discountPercent = 0;

SELECT 
    Category,
    SUM(discountedSellingPrice * availableQuantity) AS inventory_value
FROM zepto_v2
GROUP BY Category
ORDER BY inventory_value DESC;

CREATE VIEW category_summary AS
SELECT 
    Category,
    COUNT(*) AS total_products,
    ROUND(AVG(mrp), 2) AS avg_mrp,
    ROUND(AVG(discountedSellingPrice), 2) AS avg_selling_price,
    ROUND(AVG(discountPercent), 2) AS avg_discount
FROM zepto_v2
GROUP BY Category;

SELECT category,
ROUND(AVG(discountPercent),2) AS avg_discount
FROM zepto_v2
GROUP BY category
ORDER BY avg_discount DESC
LIMIT 5;

SELECT 
    CASE 
        WHEN outOfStock = 'TRUE' THEN 'Out of Stock'
        ELSE 'In Stock'
    END AS stock_status,
    COUNT(*) AS product_count
FROM zepto_v2
GROUP BY stock_status;

SELECT *
FROM zepto_v2
WHERE mrp = 0 
   OR discountedSellingPrice = 0;

SET SQL_SAFE_UPDATES = 0;

DELETE FROM zepto_v2
WHERE mrp = 0;

SET SQL_SAFE_UPDATES = 1;


