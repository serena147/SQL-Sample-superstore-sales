USE portfolio;
 SHOW TABLES;
SELECT 
    COUNT(DISTINCT `Order ID`) AS total_orders,
    COUNT(DISTINCT `Customer ID`) AS unique_customers,
    COUNT(*) AS total_items_sold,
    ROUND(SUM(Sales), 2) AS total_revenue,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_percent,
    ROUND(AVG(Sales), 2) AS avg_item_value,
    ROUND(SUM(Sales) / COUNT(DISTINCT `Order ID`), 2) AS avg_order_value
FROM `sample - superstore`;
SELECT 
    Category,
    `Sub-Category`,
    COUNT(*) AS items_sold,
    COUNT(DISTINCT `Order ID`) AS orders_containing_product,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS margin_percent
FROM `sample - superstore`
GROUP BY Category, `Sub-Category`
ORDER BY revenue DESC;
SELECT 
    Region,
    COUNT(DISTINCT `Order ID`) AS orders,
    COUNT(*) AS items_sold,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit,
    ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin
FROM `sample - superstore`
GROUP BY Region
ORDER BY profit DESC;
SELECT 
    YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS year,
    MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y')) AS month,
    COUNT(DISTINCT `Order ID`) AS orders,
    ROUND(SUM(Sales), 2) AS revenue,
    ROUND(SUM(Profit), 2) AS profit
FROM `sample - superstore`
WHERE `Order Date` IS NOT NULL AND `Order Date` != ''
GROUP BY YEAR(STR_TO_DATE(`Order Date`, '%m/%d/%Y')), 
         MONTH(STR_TO_DATE(`Order Date`, '%m/%d/%Y'))
ORDER BY year, month;
SELECT 
    `Customer Name`,
    COUNT(DISTINCT `Order ID`) AS order_count,
    ROUND(SUM(Sales), 2) AS lifetime_value,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND(AVG(Sales), 2) AS avg_item_value
FROM `sample - superstore`
GROUP BY `Customer Name`
ORDER BY lifetime_value DESC
LIMIT 10;