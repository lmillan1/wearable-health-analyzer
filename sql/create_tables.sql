CREATE TABLE daily_metrics (
    id BIGINT,
    activity_date DATE,
    total_steps INT,
    calories INT,
    very_active_minutes INT,
    fairly_active_minutes INT,
    lightly_active_minutes INT,
    sedentary_minutes INT,
    avg_heart_rate FLOAT,
    min_heart_rate FLOAT,
    max_heart_rate FLOAT,
    total_sleep_minutes FLOAT,
    asleep_minutes FLOAT,
    restless_minutes FLOAT,
    awake_minutes FLOAT
);
