-- BigQuery -- MAW
-- Yesterday's Web Unique Users

SELECT
date(date) AS day
, APPROX_COUNT_DISTNCT(CASE WHEN product_experience IN ('Desktop Web') THEN user_id END)) AS desktop_users
, APPROX_COUNT_DISTNCT(CASE WHEN product_experience IN ('Mobile Web') THEN user_id END)) AS mobile_web_users
, APPROX_COUNT_DISTNCT(CASE WHEN product_experience IN ('Tablet Web') THEN user_id END)) AS tablet_Web_users
FROM maw_views.v_fact_product_event
WHERE product_name = "HuffPost"
AND date(date) = DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY)
AND is_corp_data = TRUE 
GROUP BY 1