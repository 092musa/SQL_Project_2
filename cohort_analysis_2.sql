SELECT
    DATE_TRUNC('month', ca.orderdate)::date AS year_month,
    SUM(total_net_revenue) AS total_revenue,
    COUNT(DISTINCT ca.customerkey) AS total_customers,
    SUM(total_net_revenue) / COUNT(DISTINCT ca.customerkey) AS customer_revenue
FROM cohort_analysis ca
GROUP BY
    year_month
ORDER BY
    year_month;