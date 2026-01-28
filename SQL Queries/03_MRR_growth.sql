USE PROEJCT2_Revenue_Monetization_Analysis;
GO
/* =========================================================
   PROJECT: Revenue & Monetization Analytics (SaaS)
   FILE: 03_mrr_growth.sql
   PURPOSE: Calculate MRR Month-over-Month (MoM) Growth %.

   BUSINESS CONTEXT:
   - MRR level tells "how big" revenue is.
   - MRR growth tells "how fast" the business is expanding or contracting.
   - Growth rate is essential for understanding momentum and forecasting.

   WHAT THIS SCRIPT DOES:
   1. Aggregates monthly MRR
   2. Uses LAG() to retrieve prior month MRR
   3. Computes MoM growth rate with division-safe logic

   WHY THIS MATTERS:
   - Helps diagnose slowing growth, acceleration or contraction
   - Sets up executive reporting and trend narratives

   DEPENDS ON: dbo.v_txn_net

   OUTPUT: month_start, mrr, prev_mrr, mrr_growth_pct
   ========================================================= */

WITH mrr AS (
    /* ---------------------------------------------------------
       Step 1: Compute monthly MRR
       --------------------------------------------------------- */
    SELECT
        v.month_start,
        SUM(CASE WHEN v.transaction_type='subscription' THEN v.net_amount ELSE 0 END) AS mrr
    FROM dbo.v_txn_net v
    GROUP BY v.month_start
)
SELECT
    month_start,
    mrr,

    /* Prior month MRR for growth comparison */
    LAG(mrr) OVER (ORDER BY month_start) AS prev_mrr,

    /* ---------------------------------------------------------
       Step 2: MoM Growth %
       Guard against divide-by-zero; return NULL when prev_mrr = 0
       --------------------------------------------------------- */
    CASE
        WHEN LAG(mrr) OVER (ORDER BY month_start) = 0 THEN NULL
        ELSE (mrr - LAG(mrr) OVER (ORDER BY month_start)) * 1.0
             / LAG(mrr) OVER (ORDER BY month_start)
    END AS mrr_growth_pct
FROM mrr
ORDER BY month_start;
