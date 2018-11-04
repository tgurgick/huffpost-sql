-- BigQuery -- MAW
-- Yesterday's Web Classic Pageviews

SELECT
date(date) AS day
, SUM(classic_pageview) as pageviews
FROM maw_views.v_fact_product_event
WHERE product_name = "HuffPost"
AND date(date) = DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY)
AND is_corp_data = TRUE 
GROUP BY 1