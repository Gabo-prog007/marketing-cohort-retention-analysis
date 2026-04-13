SELECT
    "CohortMonth",
    "CohortIndex",
    SUM("Revenue") AS total_revenue,
    SUM(SUM("Revenue")) OVER (PARTITION BY "CohortMonth" ORDER BY "CohortIndex") AS cumulative_revenue
FROM transactions
GROUP BY "CohortMonth", "CohortIndex"
ORDER BY "CohortMonth", "CohortIndex";