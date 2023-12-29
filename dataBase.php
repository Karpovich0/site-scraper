<?php

$db_server = "localhost";
$db_user = "root";
$db_password = "";
$db_name = "sites";
$connection;

function startDB()
{
	global $connection, $db_server, $db_user, $db_password, $db_name;

	try {
		$connection = mysqli_connect($db_server, $db_user, $db_password, $db_name);
	} catch (mysqli_sql_exception $e) {
		echo "Couldn't connect. Error: " . $e->getMessage();
	}
}

function EndDB()
{
	global $connection;
	mysqli_close($connection);
}

function PutDB($url, $element, $count, $duration, $domain)
{
	global $connection;

	$sql = "INSERT INTO results (url, element, count, duration, domain)	VALUES ('$url', '$element', '$count', '$duration', '$domain')";

	try {
		mysqli_query($connection, $sql);
	} catch (mysqli_sql_exception $e) {
		echo "Couldn't put data. Error: " . $e->getMessage();
	}
}

function GetData($url, $element)
{
	$sql = "SELECT *
	FROM results
	WHERE url = '$url' AND element = '$element'
	ORDER BY date DESC
	LIMIT 1";

	$response_array = GetDataFromDB($sql);
	$statistic_array = GetDataFromDB(GetStatistic($response_array["domain"], $response_array["element"]));
	echo json_encode(array_merge($response_array, $statistic_array));
}

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

function GetDataFromDB($sql)
{
	global $connection;
	try {
		$result = mysqli_query($connection, $sql);
		if (mysqli_num_rows($result) > 0) {
			return mysqli_fetch_array($result);
		}
	} catch (mysqli_sql_exception $e) {
		echo "Couldn't get data. Error: " . $e->getMessage();
	}
}

function ReturnIsActual($url, $element)
{
	global $connection;

	$sql = "SELECT *
	FROM results
	WHERE TIMESTAMPDIFF(MINUTE, date, NOW()) <= 5
	AND url = '$url'
	AND element = '$element';
	";

	try {
		$result = mysqli_query($connection, $sql);
		if (mysqli_num_rows($result) > 0) {
			return true;
		} else {
			return false;
		}
	} catch (mysqli_sql_exception $e) {
		echo "Couldn't get. Error: " . $e->getMessage();
	}
}
?>

