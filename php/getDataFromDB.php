<?php
//this is a function-helper to get data from db which receives SQL query
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
?>
