---
layout: default
title: CSUEB Electric Scooter Fleet Rollout - Multidisciplinary Systems Design
logo: /assets/images/scooter_system_architecture.png
---

# CSUEB Electric Scooter Fleet Rollout

**Domain:** Systems Logistics | Financial Engineering | IoT Infrastructure | Regulatory Compliance  
**Tools & Frameworks:** Operations Research, Cash Flow Analysis (NPV/MARR), Systems Engineering (Type A/B/C Specs), Joyride IoT, Kuhmute Smart Hubs

> **Executive Impact & Project Summary:** Conducted an end-to-end Systems Design and Economic Feasibility study for a localized 130-vehicle electric scooter micro-mobility rollout at Cal State East Bay (2026–2031). The project establishes a **$32k to $588k Net Present Value (NPV)** across a 5-year operating lifecycle, supported by a 60-month quantitative cash flow Excel model, multi-variable MARR financing analysis, and comprehensive Type A/B/C engineering specifications.

### Project Resources & Supporting Documents
* [📥 Download Original Financial & Cash Flow Model (.xlsx)](https://github.com/evanjameswarren/evanjameswarren.github.io/raw/main/Electic%20Scooter%20Fleet/INDE%20460%20-%20Cost%20Final%20Project.xlsx)
* [📥 Download Complete Systems Engineering Specification (.docx)](https://github.com/evanjameswarren/evanjameswarren.github.io/raw/main/Electic%20Scooter%20Fleet/CSUEB%20Electric%20Scooter%20Rollout.docx)

---

## 1. Problem Definition & Campus Context
Cal State East Bay (CSUEB) is a major commuter campus where students face severe time constraints, steep elevation changes, and distant parking lots situated on the campus outskirts. Walking between remote parking areas and elevated academic buildings causes transit delays and student fatigue.

This project engineers a localized micro-mobility ecosystem designed to provide quick, on-demand campus transit while maintaining strict safety, ADA accessibility, and financial viability.

---

## 2. Multidisciplinary Systems Engineering Considerations

### A. Financial Engineering & Economic Modeling
* **Net Present Value & MARR Evaluation:** Formulated a 60-month cash flow schedule evaluating project feasibility against the Minimum Acceptable Rate of Return (MARR) across 1-year, 3-year, and 5-year financing annuity structures (5%–7% nominal interest rates with 25% down payment).
* **Inflation & Sensitivity Analysis:** Modeled compounding inflation factors (3.5% annual baseline) applied to labor, permits, software, and spare parts costs.
* **Revenue & Adoption Sensitivity:** Evaluated student opt-in fee pricing ($210/year) across volume adoption scenarios (baseline 1,080 annual opt-in users generating $226k–$251k annual revenue), incorporating tier-trigger protections if adoption fluctuates.

### B. Fleet Reliability & Maintenance Logistics
* **Fleet Sizing:** Specified 100 active fleet units + 30 spare rotation units (**130 total scooters**) to guarantee 95%+ peak-hour availability.
* **Spare Parts & Inventory Buffer:** Capitalized a $3,000 dedicated on-site storage facility holding a 2-month stock buffer of spare parts and components to eliminate off-site replacement delays.
* **Outsourced Technician Labor:** Partnered with local service provider (East Bay Motorsports) for technical support at $100/hr, tracking maintenance history via a managed service log.
* **Logistics & Freight Costs:** Factored initial vehicle shipping, component freight, and annual replacement part logistics into monthly cash flows.

### C. Infrastructure & Electrical Installation
* **Kuhmute Smart Hub Deployment:** Designed 5 site-developed Kuhmute smart hub stations featuring 20 charging ports each (100 active docked charging ports) with MLCS adapters for real-time status monitoring.
* **Site Preparation & Safety Barriers:** Allocated a $6,000 capital budget for site preparation, visual lane markers, and physical pedestrian barriers.
* **Electrical & Utility Grid Load:** Modeled monthly utility power consumption (~$175–$195/mo inflated) for 243Wh 48V battery systems with 5–6 hour charging cycles.

### D. Software, IoT & User Experience (UI/UX)
* **Joyride Mobile Platform:** Integrated Joyride Scale Plan ($2,500/mo licensing) linked with CSU student credential authentication.
* **Dynamic Geofencing & Speed Control:** Utilized location-based IoT modules to govern top speeds to 12 mph in high-risk downhill zones and automatically disable scooters outside campus boundaries.
* **Automated Low-Battery Prompts:** Programmed system to prompt users to end rides and return scooters to Kuhmute charging hubs when battery capacity drops below 30%.

### E. Regulatory, Permitting & Legal Compliance
* **Multi-Agency Permitting:** Budgeted annual permits ($2,500/yr baseline) covering CSU Building, ADA Clearance, Electrical, Fire Marshal, Environmental Health & Safety (EHS), and SMOP permits.
* **California Vehicle Code (CVC) Compliance:** Enforced CVC regulations (prohibiting sidewalk operation, mandating front/rear lights, braking standards, and max 15 mph operating speed).
* **ADA Path Clearance:** Ensured hub placement maintains required wheelchair path clearances and pedestrian right-of-way.

---

## 3. Quantitative Financial Summary (Excel Model Outputs)

| Financial Metric | Baseline Model Value | Notes / Description |
| :--- | :---: | :--- |
| **Initial Capital Investment** | **~$73,158** | 25% down payment on fleet + storage + site prep |
| **5-Year Project NPV** | **$32,000 – $588,000** | Scaled across student opt-in adoption scenarios |
| **Annual Opt-In Student Fee** | **$210.00 / year** | Yields $226k – $251k gross annual revenue |
| **Monthly Operating Expenses** | **~$16,000 / month** | Includes loan annuity, Joyride licensing, labor & parts |
| **Active Fleet Size** | **100 Units (30 Spares)** | Supported by 5 Kuhmute Hubs (100 charging ports) |

---

[← Back to Main Portfolio](../index.html)
