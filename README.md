<p align="center">
  <img src="https://github.com/jessicaswareena/Saas_Revenue_and_Monetization_Analytics/blob/9a25b38c9974bac613f0a5cdb8165ad097db51f1/Images/Wobly-Logo.png" width="250">
</p>

# Why Revenue Fell While Signups Grew: A Driver-Based MRR and Churn Analysis
<h2 align="center">  Understanding the Challenge </h2>

**Wobly, a subscription-based SaaS startup**,  saw something alarming: despite fresh customers joining up and people utilizing the software, **Monthly Recurring Revenue (MRR)** began to fall. Leadership could feel something was off, but they didn’t yet know why.

They were wrestling with questions like:

  • Are we losing customers faster than we can bring them in?

  • Are existing customers quietly downgrading their plans or reducing spend?

  • Is there something broken in how we earn and retain revenue, not just how we sell?

As the **data analyst supporting Finance, Product, and Growth,** the mission was clear: **go beyond surface-level revenue reporting** and find the actual drivers of revenue fluctuations across time.

<h2 align="center"> Project Overview </h2>

Wobly operates as a **B2B SaaS** company that provides a workflow and collaboration platform to assist teams manage their work and interact more effectively. Over time, it has expanded to service over **6,500 active business customers**, each of whom rely on its tools to operate their daily operations. The company operates on a **subscription model**, providing a clear value ladder with **Free, Basic, Pro, and Enterprise** options, allowing smaller teams to start small and bigger businesses to scale up as their requirements expand. Its customer base spans **North America and Europe**, representing a varied range of markets, corporate sizes, and use cases.This project's covers an **18-month timeframe** from January 2024 to June 2025, including periods of great growth and warning indicators in revenue.

Despite a constant influx of new clients, the firm entered 2025 with **volatile MRR**, and leadership had little foresight into:

  • How much income was lost each month due to **churn** (customer cancellations).

  • Whether existing consumers were increasing or decreasing their consumption.

  • Whether expansion could be sustained **without increasing acquisition costs.**

This analysis aimed to answer those questions with data, clarity, and context.

 <h2 align="center"> Key Questions Guiding the Work </h2>
To determine the root reason of the income loss, the analysis is structured around four simple yet effective questions:

**MRR Performance**

  • How has recurring income changed month to month?

  • When did it peak, and how fast did it start to fall?

**Revenue drivers**

  • What drives MRR up or down: new customers, upgrades, downgrades, or churn?

  • In a normal month, which of these drivers has the most impact?

**Revenue Mix**

  • Which subscription tiers: Free, Basic, Pro, and Enterprise -generate the most revenue?

  • How risky is it if a major portion of revenue is based on a single tier, such as Pro?

**Retention Quality**

  • Can Wobly develop from its present clients, or will it have to rely on ongoing new sales?

  • What do indicators such as Net Revenue Retention (NRR) and Gross Revenue Retention (GRR) reveal about long-term health?

All subsequent sections are directly related to these questions.
<h2 align="center">  Dataset Structure and ERD (Entity relationship diagram) </h2>
The dataset simulated a real SaaS environment using these key tables:

![image alt](https://github.com/jessicaswareena/Saas_Revenue_and_Monetization_Analytics/blob/66bca45a3d85389d553c2ceaa1651c8856afc97f/Images/ERD.png) 

This structure allowed analysis without distortion from partial months and ensured each MRR or retention figure accurately reflected real performance. The dataset is AI-generated and synthetic, created to model realistic SaaS subscription, revenue, and retention dynamics.The data distributions and structure were created to replicate actual production systems without utilizing sensitive or confidential information.

<h2 align="center">  Executive Overview </h2>

![image alt](https://github.com/jessicaswareena/Saas_Revenue_and_Monetization_Analytics/blob/66bca45a3d85389d553c2ceaa1651c8856afc97f/Images/ExecutiveOverview.png)
### Overview of Findings

**Revenue Performance Overview**

When the numbers were stitched together, a clear pattern emerged:

MRR peaked in late 2024 and then progressively decreased during the following months.

Revenue was disproportionately concentrated in the Pro category, which meant that the majority of the company's income came from a single set of clients.

Three critical health parameters presented a concerning picture:

    » Net revenue retention (NRR): 74%

    » Gross revenue retention (GRR): 62%.

    »  MRR churn: 16%.

These numbers revealed that the most significant issue was retention, not the ability to attract new clients.

**MRR Change Drivers**

Month after month, Wobly's MRR was being pushed in conflicting ways, with some factors dragging it up and others bringing it down. Three patterns emerged when these forces were split out:

  • The churned MRR constantly outpaced the new and expansion MRR.

  • Revenue losses were not random; they constituted a consistent downward trend over time.

  • The company did not struggle to create interest or conclude agreements; rather, it suffered to keep the revenue earned.

In other words, the issue wasn't filling the bucket; it was the quantity of holes in it.

**Retention and Revenue Sustainability**

The retention metrics verified what the driver analysis revealed:

  • NRR less than 100% indicates that current customers, on average, do not generate net growth.

  • The reduction in GRR indicates that too much base revenue is being lost before upsells may have an impact.

  • This combination produces volatile, hard-to-predict monthly revenue, making planning and forecasting considerably more challenging.
  
The entire interactive dashboard can be downloaded [here.](https://app.powerbi.com/reportEmbed?reportId=503fce24-4820-412a-af7b-41ef62f0d95c&autoAuth=true&ctid=750d3a3f-1f46-4da2-8a64-7605e75ea2f9)

All SQL queries used for this analysis can be found [here.](https://github.com/jessicaswareena/Saas_Revenue_and_Monetization_Analytics/tree/b8fdb6341700adf6bb0d6b96ead4cd20b0c9ff9c/SQL%20Queries) 
<h2 align="center">  Insights Deep Dive </h2>

**MRR Trend & Momentum**

  • MRR increased consistently during most of 2024, providing leadership with confidence that the business plan was functioning. 
  
  • However, as 2025 neared, the curvature began to flatten and lean downward. The turnaround point coincided with an increase in churn, indicating that the brakes on growth were caused by more customers leaving or declining, rather than fewer sales.
![image alt](https://github.com/jessicaswareena/Saas_Revenue_and_Monetization_Analytics/blob/66bca45a3d85389d553c2ceaa1651c8856afc97f/Images/RevenueDrivers.png)

**Revenue Driver Breakdown**

By charting every gain and loss each month, the situation became clear:

  • New and expanded revenue obviously helped to drive growth.

  • However, attrition and downgrades have routinely wiped out such increases, leaving net new MRR negative in recent months.

This revealed the underlying issue: Wobly did not have a sales problem, but rather a revenue leakage issue.

![image alt](https://github.com/jessicaswareena/Saas_Revenue_and_Monetization_Analytics/blob/66bca45a3d85389d553c2ceaa1651c8856afc97f/Images/Retention%26Sustainability.png)

**Retention Health**

From a retention standpoint, the business was working against gravity:

  • With NRR below 100%, every month started in a hole; the company needed new sales just to get back to where it had been.

  • The metaphor is simple: new sales keep filling the bucket, but multiple leaks mean the water level never rises.

 <h2 align="center"> Conclusions </h2>
 
Once the various components of the income narrative were linked, the findings were plain and direct:

  • The organization does not have an acquisition problem; it understands how to acquire and sign up clients.

  • The primary danger to revenue is churn and plan downgrades, particularly among higher-paying consumers.

  • Growth under existing conditions cannot be sustained without first addressing the retention issue.

  • The biggest return on investment (ROI) will be achieved by enhancing retention and plan stability rather than merely increasing marketing and sales expenses.

<h2 align="center">  Executive Highlights </h2>

For leaders that require the essence in a few key bullets:

  • The decline in MRR is primarily due to customer churn, not a lack of new revenue.

  • Churned and degraded income frequently balance benefits from new and enlarged accounts.

  • More than 60% of income is on the Pro plan, which creates a concentrated risk if those clients leave.

  • NRR below 100% indicates unsustainable growth, with the existing base contracting rather than increasing.

  • The quickest method to stabilize and then grow revenue is to prioritize retention improvements before expanding acquisition.

<h2 align="center">  Recommendations </h2>

**1. Tackle Churn Head-On**

First, focus on understanding and minimizing churn:

  • Analyze turnover by plan tier and customer segment to identify the most vulnerable populations.

  • Improve onboarding and early activation to ensure that new clients soon perceive the benefit.

  • Increase proactive communication during the first several months, when consumers are most likely to depart.

**2. Drive expansion opportunities.**

Transform pleased consumers into a growth engine:

  • Create clear and appealing upgrade pathways from Free and Basic to Pro and Enterprise.

  • Use data to identify high-engagement accounts and target them for upsells.

**3. Minimize Revenue Concentration Risk.**

Protect the firm from leaning too much on one tier:

  • Increase basic-tier conversions so that more clients begin paying.

  • Encourage Enterprise adoption among big or rapidly increasing accounts.

  • Gradually lessen reliance on Pro as the sole source of income.

**4. Hold off on aggressive acquisition.**

Avoid putting additional money into a leaking system:

  • Maintain consistent acquisition spend while addressing core retention challenges.

  • Improved churn and expansion will quadruple the impact of every subsequent marketing investment.
<h2 align="center"> What I'do next with more data </h2>

With more data, the analysis might be more detailed and predictive:

  • Conduct a cohort study to see how turnover changes as consumers age on the platform.

  • LTV/CAC may be calculated by combining revenue and marketing data, allowing for more informed growth investment decisions.

  • Combine subscription and product usage data to identify early symptoms of churn.

  • Run MRR scenario models (for example, improving GRR by 5% over six months) to predict impact.

  • Design and test A/B trials for onboarding, pricing, and communication to determine which retention techniques provide the most boost.

<h2 align="center">  Data foundation & assumptions </h2>

To make the results dependable and easy to comprehend, the project follows to a few essential criteria:

• All analysis is performed on a monthly basis, utilizing only complete months of data.

• Revenue is rigorously defined as recurring subscription income (MRR), rather than one-time payments.

• Churn deals with both outright cancellations and non-renewals.

• The model assumes that each client has just one main subscription and does not include any multi-product packages.

• All findings relate to the period January 2024 - June 2025, however they can be revised when new data becomes available.



