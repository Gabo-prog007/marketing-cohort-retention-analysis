WITH cohort_counts AS (
    SELECT
        "CohortMonth",
        "CohortIndex",
        COUNT(DISTINCT "Customer ID") AS num_customers
    FROM transactions
    GROUP BY "CohortMonth", "CohortIndex"
),
cohort_sizes AS (
    SELECT
        "CohortMonth",
        num_customers AS cohort_size
    FROM cohort_counts
    WHERE "CohortIndex" = 1
)
SELECT
    cc."CohortMonth",
    cc."CohortIndex",
    cc.num_customers,
    cs.cohort_size,
    ROUND((cc.num_customers * 100.0 / cs.cohort_size), 2) AS retention_rate_pct
FROM cohort_counts cc
JOIN cohort_sizes cs ON cc."CohortMonth" = cs."CohortMonth"
ORDER BY cc."CohortMonth", cc."CohortIndex";