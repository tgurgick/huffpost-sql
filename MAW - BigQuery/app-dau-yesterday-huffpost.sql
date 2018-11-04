-- BigQuery -- MAW
-- Yesterday's App Unique Users

SELECT
date(date) as day
, APPROX_COUNT_DISTINCT user_id as app_users
FROM maw_views.v_fact_product_app_hourly
WHERE product_name = "HuffPost"
AND date(date) = DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY)
AND is_corp_data = TRUE
GROUP BY 1