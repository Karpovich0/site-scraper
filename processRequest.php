<?php
include "dataBase.php";
startDB();

if (isset($_POST)) {
	$data = file_get_contents("php://input");

	$user = json_decode($data, true);
	$is_actual = ReturnIsActual($user["url"], $user["element"]);
	if ($is_actual) {
		GetData($user["url"], $user["element"]);
	} elseif (array_key_exists('domain', $user)) {
		PutDB($user["url"], $user["element"], $user["count"], $user["duration"], $user["domain"]);
		GetData($user["url"], $user["element"]);
	} else {
		echo json_encode(["isNotActual" => true]);
	}
}

EndDB();

?>
