<?php
//function returns SQL query to get GENERAL statistics
function GetStatistic($domain, $element)
{
	$combinedSql = "
	SELECT
		domain,
		COUNT(*) AS appearance_url_count,
		(
			SELECT ROUND(AVG(duration), 0) 
			FROM results 
			WHERE date >= NOW() - INTERVAL 24 HOUR AND domain = '$domain'
		) AS average_fetch_time,
		(
			SELECT SUM(count) 
			FROM results 
			WHERE domain = '$domain' AND element = '$element'
		) AS total_count,
		(
			SELECT SUM(count) 
			FROM results 
			WHERE element = '$element'
		) AS total_element_count
	FROM 
		results
	WHERE 
		domain = '$domain';
	";

	return $combinedSql;
}
?>
