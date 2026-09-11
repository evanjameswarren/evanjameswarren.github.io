# Snowboard Sales Forecasting Model

**Domain:** Time Series Analysis | Demand Forecasting | Inventory Optimization  
**Tools & Frameworks:** Exponential Smoothing (Holt-Winters), Error Metrics (MAPE, RMSE), Excel / Python

---

## 1. Problem Statement
Snowboard retail demand exhibits extreme seasonality and annual trend fluctuations. Inaccurate demand forecasts lead to either costly overstocking/holding costs or lost revenue due to stockouts during peak winter months.

---

## 2. Methodology & Tools Applied
* **Decomposition:** Separated raw historical sales data into level, trend, and seasonal components.
* **Holt-Winters Multiplicative Model:** Parameterized alpha ($\alpha$), beta ($\beta$), and gamma ($\gamma$) smoothing factors to capture multiplicative seasonal spikes.
* **Error Analysis:** Evaluated forecast performance using Mean Absolute Percentage Error (MAPE) and Root Mean Squared Error (RMSE) across holding-out validation sets.

---

## 3. Visuals & Performance Metrics

| Model Metric | Baseline Moving Average | Holt-Winters Model | Improvement |
| :--- | :--- | :--- | :--- |
| **MAPE (%)** | 18.4% | **6.2%** | **-66.3%** |
| **RMSE (units)** | 420 | **145** | **-65.5%** |

---

## 4. Results & Quantified Impact
* **Accuracy Improvement:** Reduced forecasting error (MAPE) to ~6%, significantly improving safety stock calculations.
* **Inventory Cost Reduction:** Optimized reorder points to prevent overbuilding inventory prior to off-peak seasons.

---

[← Back to Main Portfolio](../index.html)
