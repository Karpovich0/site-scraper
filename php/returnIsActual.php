<?php
//checks if there was a request to this site about this element in recent 5 minutes
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
