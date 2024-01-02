<?php
include "dataBase.php";
include "./sanitizeInput.php";
include "./returnIsActual.php";
startDB();

if (isset($_POST)) {
	$data = file_get_contents("php://input");
	//get data from form
	$user = json_decode($data, true);

	//sanitize url and element
	$url = filter_var($user["url"], FILTER_SANITIZE_URL);
	$element = preg_replace('/[^a-zA-Z0-9]/', '', $user["element"]);

	// $is_actual shows if there was a request in the last 5 minutes
	$is_actual = ReturnIsActual($user["url"], $user["element"]);
	if ($is_actual) {
		// 1. if there was - return existing result
		GetData($url, $element);
	} elseif (array_key_exists('domain', $user)) {
		$sanitized_array = SanitizeInputs($user);
		// 3. after a request to the target site, we put new data into the database
		PutDB($url, $element, $sanitized_array["count"], $sanitized_array["duration"], $sanitized_array["domain"]);
		GetData($url, $element);
	} else {
		// 2. if there wasn't - return to frontend command that we need to do a request to target site
		echo json_encode(["isNotActual" => true]);
	}
}

EndDB();

?>
