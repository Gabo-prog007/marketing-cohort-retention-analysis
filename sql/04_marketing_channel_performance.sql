SELECT
    "Marketing_Channel",
    COUNT(DISTINCT "Customer ID") AS unique_customers,
    SUM("Revenue") AS total_revenue,
    SUM("Quantity") AS total_items_sold,
    ROUND(SUM("Revenue") / COUNT(DISTINCT "Customer ID"), 2) AS avg_revenue_per_customer
FROM transactions
GROUP BY "Marketing_Channel"
ORDER BY total_revenue DESC;