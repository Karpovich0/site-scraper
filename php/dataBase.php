<?php
include "./getStatistic.php";
include "./getDataFromDB.php";

$db_server = "localhost";
$db_user = "root";
$db_password = "";
$db_name = "sites";
$connection;
// before every request we need to start our connection with our DB
function startDB()
{
	global $connection, $db_server, $db_user, $db_password, $db_name;

	try {
		$connection = mysqli_connect($db_server, $db_user, $db_password, $db_name);
	} catch (mysqli_sql_exception $e) {
		echo "Couldn't connect. Error: " . $e->getMessage();
	}
}
// after every request we need to close our connection with our DB
function EndDB()
{
	global $connection;
	mysqli_close($connection);
}
// put new data in DB
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

//we use this function to get data from DB via using url + element in SQL query
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
?>

