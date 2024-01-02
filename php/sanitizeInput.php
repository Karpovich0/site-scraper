<?php
//function to protect our DB from injection attacks
function SanitizeInputs($user)
{
	try {
		$count = preg_replace('/[^0-9]/', '', $user["count"]);
		$duration = preg_replace('/[^0-9]/', '', $user["duration"]);
		$domain = preg_replace('/[^a-zA-Z0-9.-]/', '', $user["domain"]);
		$sanitized_array = ["count" => $count, "duration" => $duration, "domain" => $domain];
		return $sanitized_array;
	} catch (Exception $e) {
		echo "Error: " . $e->getMessage();
	}
}
?>
