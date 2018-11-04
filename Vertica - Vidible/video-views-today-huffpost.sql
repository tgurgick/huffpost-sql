-- VERTICA -- MERCURY -- VIDIBLE
-- today's views

SELECT				
to_char(date, 'YYYY-Q') as quarter
,   a.date as day						
,	sum(a.player_starts) as player_starts		
,	sum(a.video_view_3_sec) as video_view_3_sec					
FROM aolon.vidible_performance_video a				
WHERE a.date = current_date			
AND (buyer_company_id = '56000e19e4b0e4e194b84b31'	-- HuffPost			
OR buyer_parent_company_id = '56000e19e4b0e4e194b84b31') -- HuffPost					
GROUP BY 1,2
ORDER BY quarter DESC