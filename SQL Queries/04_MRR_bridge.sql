USE PROEJCT2_Revenue_Monetization_Analysis;
GO
/* =========================================================
   PROJECT: Revenue & Monetization Analytics (SaaS)
   FILE: 04_mrr_bridge.sql
   PURPOSE:
   Explain month-over-month MRR movement by decomposing
   revenue changes into core SaaS growth levers.

   BUSINESS QUESTION:
   What is driving changes in MRR each month?

   WHAT THIS SCRIPT DOES:
   1. Builds customer-level MRR by month
   2. Compares each customer’s MRR to the previous month
   3. Classifies revenue movement into:
      - New MRR
      - Expansion MRR
      - Contraction MRR
      - Churned MRR
   4. Aggregates changes to explain net MRR movement

   WHY THIS MATTERS:
   - MRR alone shows growth level
   - This bridge explains *why* MRR changed
   - Core artifact used by finance & revenue teams

   OUTPUT:
   Monthly MRR bridge table used for waterfall charts
   ========================================================= */


/* =========================================================
   STEP 1: Customer-level monthly MRR
   ========================================================= */

WITH customer_mrr AS (
    SELECT
        v.month_start,
        v.customer_id,
        SUM(CASE
            WHEN v.transaction_type = 'subscription'
            THEN v.net_amount
            ELSE 0
        END) AS mrr
    FROM dbo.v_txn_net v
    GROUP BY v.month_start, v.customer_id
),


/* =========================================================
   STEP 2: Month-over-month comparison per customer
   ========================================================= */
mrr_delta AS (
    SELECT
        cur.month_start,
        cur.customer_id,
        COALESCE(prev.mrr, 0) AS prev_mrr,
        cur.mrr AS curr_mrr,
        cur.mrr - COALESCE(prev.mrr, 0) AS delta
    FROM customer_mrr cur
    LEFT JOIN customer_mrr prev
        ON prev.customer_id = cur.customer_id
       AND prev.month_start = DATEADD(MONTH, -1, cur.month_start)
)


/* =========================================================
   STEP 3: Classify and aggregate MRR movement
   ========================================================= */
SELECT
    month_start,
    CASE
        WHEN prev_mrr = 0 AND curr_mrr > 0 THEN 'New MRR'
        WHEN prev_mrr > 0 AND curr_mrr = 0 THEN 'Churned MRR'
        WHEN delta > 0 THEN 'Expansion MRR'
        WHEN delta < 0 THEN 'Contraction MRR'
        ELSE 'Retained MRR'
    END AS mrr_movement_type,
    SUM(delta) AS mrr_change
FROM mrr_delta
GROUP BY
    month_start,
    CASE
        WHEN prev_mrr = 0 AND curr_mrr > 0 THEN 'New MRR'
        WHEN prev_mrr > 0 AND curr_mrr = 0 THEN 'Churned MRR'
        WHEN delta > 0 THEN 'Expansion MRR'
        WHEN delta < 0 THEN 'Contraction MRR'
        ELSE 'Retained MRR'
    END
ORDER BY month_start, mrr_movement_type;
