<?php
// $url = "https://colnect.com/en";
// $element = "<img";
// ReturnDoNewRequestNeeded($url);

// function ReturnDoNewRequestNeeded($url)
// {
// 	global $element;
// 	$ch = curl_init();

// 	// Set cURL options
// 	curl_setopt($ch, CURLOPT_URL, $url);
// 	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

// 	// Execute cURL session and get the response
// 	$response = curl_exec($ch);

// 	// Check for cURL errors
// 	if (curl_errno($ch)) {
// 		echo 'Curl error: ' . curl_error($ch);
// 	}

// 	// Close cURL session
// 	curl_close($ch);

// 	// Output the response
// 	countSubstringOccurrences($response, $element);
// }

function countSubstringOccurrences($string, $substring)
{
	// Use substr_count to count occurrences
	$count = substr_count($string, $substring);

	// Return the count
	echo $count;
}

?>
