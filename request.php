<?php

function countSubstringOccurrences($string, $substring)
{
	// Use substr_count to count occurrences
	$count = substr_count($string, $substring);

	// Return the count
	echo $count;
}

?>
