-- VERTICA -- MERCURY -- VIDIBLE
-- Yesterday's top mobile videos

SELECT
b.video_title
, 	sum(a.video_view_3_sec) as video_view_3_sec 
FROM aolon.vidible_performance_video a 
LEFT JOIN (SELECT id, video_title, creation_date FROM aolon.vidible_dim_video) b ON a.video_id = b.id
WHERE a.date = (current_date - 1)
AND (buyer_company_id = '56000e19e4b0e4e194b84b31' 
OR buyer_parent_company_id = '56000e19e4b0e4e194b84b31') 
AND device_type_name = 'Mobile Phone'
GROUP BY 1 ORDER BY 2 DESC LIMIT 5