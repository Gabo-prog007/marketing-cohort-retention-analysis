WITH cohort_ltv AS (
    SELECT
        "CohortMonth",
        "Customer ID",
        SUM("Revenue") AS customer_total_revenue
    FROM transactions
    GROUP BY "CohortMonth", "Customer ID"
)
SELECT
    "CohortMonth",
    COUNT(DISTINCT "Customer ID") AS num_customers,
    ROUND(AVG(customer_total_revenue), 2) AS avg_ltv,
    ROUND(SUM(customer_total_revenue), 2) AS total_revenue
FROM cohort_ltv
GROUP BY "CohortMonth"
ORDER BY "CohortMonth";