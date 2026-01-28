USE PROEJCT2_Revenue_Monetization_Analysis;
GO
/* =========================================================
   PROJECT: Revenue & Monetization Analytics (SaaS)
   FILE: 02_mrr_core.sql
   PURPOSE:
   Calculate core Monthly Recurring Revenue (MRR) outputs.

   BUSINESS CONTEXT:
   - MRR is the primary North Star metric for subscription SaaS growth.
   - Leadership tracks MRR trend and mix (which tiers drive revenue).

   WHAT THIS SCRIPT DOES:
   1. Calculates monthly MRR from subscription transactions
   2. Breaks MRR down by plan tier to assess plan mix

   WHY THIS MATTERS:
   - Establishes the revenue baseline (MRR) used throughout the project
   - Shows whether growth is driven by high-value plans or low-tier volume

   DEPENDS ON:
   dbo.v_txn_net

   OUTPUT:
   (A) Monthly MRR table
   (B) Monthly MRR by plan tier table
   ========================================================= */

------------------------------------------------------------
-- (A) MONTHLY MRR: Sum of net subscription transaction amounts per month
------------------------------------------------------------
SELECT
    CAST(v.month_start AS date) AS month_start,
    SUM(CASE WHEN v.transaction_type = 'subscription' THEN v.net_amount ELSE 0 END) AS mrr
FROM dbo.v_txn_net v
GROUP BY v.month_start
ORDER BY v.month_start;


------------------------------------------------------------
-- (B) MONTHLY MRR BY PLAN TIER
-- Why:Helps identify which tiers drive revenue and how plan mix changes over time
------------------------------------------------------------
SELECT
    v.month_start,
    p.tier AS plan_tier,
    SUM(v.net_amount) AS mrr
FROM dbo.v_txn_net v
JOIN dbo.subscriptions s
    ON s.subscription_id = v.subscription_id
JOIN dbo.plans p
    ON p.plan_id = s.plan_id
WHERE v.transaction_type = 'subscription'
GROUP BY v.month_start, p.tier
ORDER BY v.month_start, p.tier;
