USE PROEJCT2_Revenue_Monetization_Analysis;
GO
/* =========================================================
   PROJECT: Revenue & Monetization Analytics (SaaS)
   FILE: 05_retention_metrics.sql
   PURPOSE:
   Create a reusable monthly retention components view for:
   - NRR
   - GRR
   - MRR Churn Rate
   ========================================================= */


/* =========================================================
   COMMON CTE: Customer-month MRR and month-over-month deltas
   ========================================================= */
CREATE OR ALTER VIEW dbo.v_retention_monthly_components AS
WITH cust_mrr AS (
    /* Customer-month subscription revenue (MRR proxy) */
    SELECT
        v.month_start,
        v.customer_id,
        SUM(CASE WHEN v.transaction_type = 'subscription' THEN v.net_amount ELSE 0 END) AS mrr
    FROM dbo.v_txn_net v
    GROUP BY v.month_start, v.customer_id
),
bridge AS (
    /* Join each customer’s current month to previous month */
    SELECT
        cur.month_start,
        cur.customer_id,
        COALESCE(prev.mrr, 0) AS prev_mrr,
        cur.mrr AS curr_mrr,
        cur.mrr - COALESCE(prev.mrr, 0) AS delta
    FROM cust_mrr cur
    LEFT JOIN cust_mrr prev
        ON prev.customer_id = cur.customer_id
       AND prev.month_start = DATEADD(MONTH, -1, cur.month_start)
),
existing AS (
    /* Only customers who had revenue last month are "existing" for retention */
    SELECT *
    FROM bridge
    WHERE prev_mrr > 0
)
    /* Aggregate retention components by month */
    SELECT
        month_start,
        SUM(prev_mrr) AS starting_mrr,
        SUM(curr_mrr) AS ending_mrr,

        /* Expansion: positive deltas */
        SUM(CASE WHEN delta > 0 THEN delta ELSE 0 END) AS expansion_mrr,

        /* Contraction: absolute value of negative deltas */
        SUM(CASE WHEN delta < 0 THEN ABS(delta) ELSE 0 END) AS contraction_mrr,

        /* Churn: customer had revenue last month but zero this month */
        SUM(CASE WHEN curr_mrr = 0 THEN prev_mrr ELSE 0 END) AS churned_mrr
    FROM existing
    GROUP BY month_start;




