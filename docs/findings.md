# Findings & Methodology

## Overview
Analysis of Fitbit wearable data from 35 users over 2 months to explore
relationships between daily activity, sleep, and heart rate.

## Methodology
1. **Data Processing** — Used PySpark to load and aggregate raw CSVs, including
   reducing 3.6M second-level heart rate readings into daily summaries
2. **Storage & Analysis** — Loaded the master dataset into PostgreSQL and wrote
   analytical SQL queries to identify patterns
3. **Visualization** — Built an interactive Tableau dashboard to communicate findings

## Key Findings

### Activity Patterns
- Users averaged 7,280 steps/day, below the 10,000 step benchmark
- Saturday was the most active day; Sunday the least
- Large variance between users — top user averaged 16,424 steps/day vs 774 for the least active

### Sleep & Activity
- Sedentary users slept the most (478 mins/day) but had the most restless sleep (32.8 mins)
- Sleep efficiency was consistent across activity levels (90-93%), suggesting activity affects sleep duration more than sleep quality
- This was the most surprising finding — more activity does not simply mean better sleep

### Heart Rate
- Average daily heart rate was similar across activity levels (77-80 BPM)
- Very active users had higher daily averages because readings captured exercise periods, not just resting heart rate 

## Limitations
- Only 15 of 35 users tracked heart rate, and 13 tracked weight — limiting those analyses
- Data spans only 2 months (March–May 2016), limiting seasonal generalizability
- Heart rate data captures daily average, not resting heart rate specifically

## What I'd Explore Next
- Longer time series to identify whether users improve activity levels over time
- Resting heart rate isolated from active periods for more accurate cardiovascular analysis
- Clustering users by behavioral profiles
