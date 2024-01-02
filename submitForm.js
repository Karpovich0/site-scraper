let url, element, timeStart, response;
const RESPONSE_URL = document.querySelector("#response-url");
const RESPONSE_DATE = document.querySelector("#response-date");
const RESPONSE_DURATION = document.querySelector("#response-duration");
const RESPONSE_COUNT = document.querySelector("#response-count");
const APPEARANCE_URL_COUNT = document.querySelector("#appearance-url-count");
const AVERAGE_FETCH_TIME = document.querySelector("#average-fetch-time");
const TOTAL_COUNT = document.querySelector("#total-count");
const TOTAL_ELEMENT_COUNT = document.querySelector("#total-element-count");
//a cycle is required to fill data
const RESPONSE_ELEMENT_ARRAY = document.querySelectorAll(".response-element");
const DOMAIN_ARRAY = document.querySelectorAll(".domain");
//show results div
const RESPONSE_DIV = document.querySelector(".response");
//we use this function to retrieve data from a form
function submitForm(data) {
	timeStart = timePoint();
	if (!data) {
		url = document.querySelector("#url").value.trim();
		element = document.querySelector("#element").value.trim();
		data = { url, element };
	}
	//1. send the data to the server
	fetch("./php/processRequest.php", {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify(data),
	})
		.then((response) => response.json())
		.then((data) => {
			response = data;
			//2. we then check if there has not been a request to the target site in the last 5 minutes.
			if (response.isNotActual) {
				//3. there was nothing in the last 5 minutes - we need to create a new one
				sendData();
			} else {
				//4. after making a new request to the target site and retrieving all data from the server, we can proceed to fill in the information
				fillResult(response);
			}
		})
		.catch((error) => {
			alert("Error: " + error.message);
		});
}
function sendData() {
	//this function sends a request to the target site and returns all the necessary statistics to record in a database
	fetch(url)
		.then((response) => {
			if (!response.ok) {
				throw new Error(`HTTP error! Status: ${response.status}`);
			}
			return response.text();
		})
		.then((responseText) => {
			const count = findAllOccurrences(responseText, element);
			let duration = calculateTime();
			let domain = new URL(url).hostname;
			submitForm({ url, element, count, duration, domain });
		})
		.catch((error) => {
			alert("Fetch error: " + error.message);
		});
}
//search for all element's appearances in html
function findAllOccurrences(mainString, subString) {	

	const domParser = new DOMParser();

    // Parse the HTML response
    const dom = domParser.parseFromString(mainString, 'text/html');

    // Find all occurrences of the specified tag
    const occurrences = dom.getElementsByTagName(subString).length;

	return occurrences;
}
//use the response from the database to fill in the results
function fillResult({
	url,
	element,
	count,
	duration,
	date,
	domain,
	appearance_url_count,
	average_fetch_time,
	total_count,
	total_element_count,
}) {
	RESPONSE_URL.textContent = url;
	RESPONSE_DATE.textContent = formatDate(date);
	RESPONSE_DURATION.textContent = duration;
	RESPONSE_COUNT.textContent = count;
	APPEARANCE_URL_COUNT.textContent = appearance_url_count;
	AVERAGE_FETCH_TIME.textContent = average_fetch_time;
	TOTAL_COUNT.textContent = total_count;
	TOTAL_ELEMENT_COUNT.textContent = total_element_count;
	RESPONSE_DIV.classList.add("response--active");
	//cycles to fill
	fillMultipleResults(RESPONSE_ELEMENT_ARRAY, element);
	fillMultipleResults(DOMAIN_ARRAY, domain);
}
//this function creates a new time point. It is necessary to calculate the duration of the entire operation
function timePoint() {
	return new Date();
}
//calculate duration
function calculateTime() {
	return timePoint() - timeStart;
}
//convert UTC to local time
function formatDate(date) {
	// Convert the UTC date string to a Date object
	const utcDate = new Date(date + " UTC");

	// Convert UTC date to local date
	return new Date(utcDate.toLocaleString()).toString();
}

//use this function when you need to fill all elements of a particular CSS class with the same data
function fillMultipleResults(elementsToFill, elment) {
	elementsToFill.forEach((item) => (item.textContent = elment));
}
