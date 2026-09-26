WITH sales_data AS (
    SELECT
        customerkey,
        SUM(quantity * netprice * exchangerate) AS total_net_revenue
    FROM sales
    GROUP BY
        customerkey
)

SELECT 
AVG(s.total_net_revenue) AS spending_cutomer_netrev,
AVG(COALESCE(s.total_net_revenue,0)) AS all_customer_netrev
FROM customer c
LEFT JOIN sales_data s ON c.customerkey = s.customerkey