-- 1. User Activity Summary
SELECT id, 
    ROUND(AVG(total_steps)::numeric, 0) AS avg_daily_steps,
    ROUND(AVG(calories)::numeric, 0) AS avg_daily_calories,
    ROUND(AVG(very_active_minutes)::numeric, 0) AS avg_very_active_mins,
    ROUND(AVG(sedentary_minutes)::numeric, 0) AS avg_sedentary_mins,
    COUNT(*) AS days_tracked
FROM daily_metrics
GROUP BY id
ORDER BY avg_daily_steps DESC;

-- 2. Activity Buckets vs Sleep Quality
SELECT
    CASE
        WHEN total_steps >= 10000 THEN 'Very Active (10k+)'
        WHEN total_steps >= 7500  THEN 'Active (7.5k-10k)'
        WHEN total_steps >= 5000  THEN 'Moderate (5k-7.5k)'
        ELSE 'Sedentary (<5k)'
    END AS activity_level,
    COUNT(*) AS days,
    ROUND(AVG(total_sleep_minutes)::numeric, 1) AS avg_sleep_mins,
    ROUND(AVG(asleep_minutes / NULLIF(total_sleep_minutes, 0) * 100)::numeric, 1) AS avg_sleep_efficiency,
    ROUND(AVG(restless_minutes)::numeric, 1) AS avg_restless_mins
FROM daily_metrics
WHERE total_sleep_minutes IS NOT NULL AND total_sleep_minutes > 0
GROUP BY activity_level
ORDER BY avg_sleep_mins DESC;

-- 3. Day of Week Analysis
SELECT
    TO_CHAR(activity_date, 'Day') AS day_of_week,
    EXTRACT(DOW FROM activity_date) AS day_num,
    ROUND(AVG(total_steps)::numeric, 0) AS avg_steps,
    ROUND(AVG(calories)::numeric, 0) AS avg_calories,
    ROUND(AVG(very_active_minutes)::numeric, 1) AS avg_very_active_mins
FROM daily_metrics
GROUP BY day_of_week, day_num
ORDER BY day_num;

-- 4. Heart Rate vs Activity Level
SELECT
    CASE
        WHEN total_steps >= 10000 THEN 'Very Active (10k+)'
        WHEN total_steps >= 7500  THEN 'Active (7.5k-10k)'
        WHEN total_steps >= 5000  THEN 'Moderate (5k-7.5k)'
        ELSE 'Sedentary (<5k)'
    END AS activity_level,
    COUNT(*) AS days,
    ROUND(AVG(avg_heart_rate)::numeric, 1) AS avg_resting_hr,
    ROUND(AVG(max_heart_rate)::numeric, 1) AS avg_max_hr,
    ROUND(AVG(total_steps)::numeric, 0) AS avg_steps
FROM daily_metrics
WHERE avg_heart_rate IS NOT NULL
GROUP BY activity_level
ORDER BY avg_steps DESC;
