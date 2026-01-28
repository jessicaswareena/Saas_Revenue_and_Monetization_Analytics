USE PROEJCT2_Revenue_Monetization_Analysis;
GO

/* =========================================================
   PROJECT: Revenue & Monetization Analytics (SaaS)
   FILE: 01_foundation_views.sql
   PURPOSE:
   Create a reusable transaction view that standardizes net revenue.

   BUSINESS CONTEXT:
   - Raw transactions can include refunds and failed payments.
   - Revenue KPIs must be built from a consistent "net revenue" definition.
   - Downstream MRR/NRR logic becomes unreliable if revenue math is inconsistent.

   WHAT THIS SCRIPT DOES:
   1. Creates a canonical transaction view at the transaction grain
   2. Creates a month bucket (month_start) for monthly reporting
   3. Normalizes revenue into a single net_amount field
      - success/refunded contribute to net_amount
      - everything else contributes 0

   WHY THIS MATTERS:
   - Ensures consistent revenue logic across all KPI queries
   - Prevents double counting and inconsistent refund handling
   - Makes MRR/NRR calculations stable and repeatable

   OUTPUT:
   dbo.v_txn_net view (transaction grain with net_amount + month_start)
   ========================================================= */

CREATE OR ALTER VIEW dbo.v_txn_net AS
SELECT
    t.transaction_id,
    t.customer_id,
    t.subscription_id,

    /* Convert to DATE to avoid time components causing month bucketing issues */
    CAST(t.transaction_date AS date) AS txn_date,

    /* month_start is the standard monthly bucket used across all KPI queries */
    DATEFROMPARTS(YEAR(CAST(t.transaction_date AS date)),
                  MONTH(CAST(t.transaction_date AS date)), 1) AS month_start,

    t.transaction_type,
    t.status,
    t.payment_method,
    t.currency,

    /* ---------------------------------------------------------
       NET REVENUE LOGIC
       - success contributes positive revenue
       - refunded contributes negative revenue (already negative in data)
       - any other status contributes 0
       --------------------------------------------------------- */
    CASE
        WHEN t.status IN ('success','refunded') THEN CAST(t.amount AS decimal(18,2))
        ELSE CAST(0.00 AS decimal(18,2))
    END AS net_amount
FROM dbo.transactions t;


