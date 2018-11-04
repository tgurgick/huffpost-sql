-- VERTICA -- MERCURY -- VIDIBLE
-- Quarterly Video Performance

SELECT				
to_char(date, 'YYYY-Q') as quarter				
,	count(distinct(date)) as days			
,	sum(a.player_starts) as player_starts		
,	sum(a.video_view_3_sec) as video_view_3_sec			
,	sum(a.video_view_3_sec) / count(distinct(date)) as daily_avg_views_3s					
FROM aolon.vidible_performance_video a				
WHERE a.date >= '2017-07-01'			
AND (buyer_company_id = '56000e19e4b0e4e194b84b31'	-- HuffPost			
OR buyer_parent_company_id = '56000e19e4b0e4e194b84b31') -- HuffPost					
GROUP BY 1
ORDER BY quarter DESC