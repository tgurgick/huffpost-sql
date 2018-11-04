-- BigQuery -- MAW
-- Yesterday's Facebook User Paths

WITH TEMP AS (
SELECT date(date)
,	network_session_referring_domain
,	property_sequence
,	property_session_id
,	event_name
FROM maw_views.v_fact_all_web_huffpost_hourly_tables
WHERE 
	network_session_referring_domain LIKE '%facebook%'
 	AND property_sequence IN ('1','2','3')
 	AND date(date) = DATE_ADD(CURRENT_DATE(), INTERVAL -1 DAY)
GROUP BY 1,2,3,4,5 
)
SELECT
'Facebook' AS ref
, a.first
, b.second
, c.third
, count(distinct a.property_session_id) AS frequency 
FROM
(SELECT 
TEMP.property_session_id
, CASE WHEN TEMP.property_sequence = '1' THEN TEMP.event_name END AS first
FROM TEMP
GROUP BY 1,2) a
LEFT JOIN 
(SELECT 
TEMP.property_session_id
, CASE WHEN TEMP.property_sequence = '2' THEN TEMP.event_name END AS second
FROM TEMP
GROUP BY 1,2) b ON a.property_session_id = b.property_session_id
LEFT JOIN
(SELECT 
TEMP.property_session_id
, CASE WHEN TEMP.property_sequence = '3' THEN TEMP.event_name END AS third
FROM TEMP
GROUP BY 1,2) c ON a.property_session_id = c.property_session_id
GROUP BY 1,2,3,4
ORDER BY count DESC