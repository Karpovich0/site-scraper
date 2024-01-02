let url, element, timeStart, response;
const RESPONSE_URL = document.querySelector("#response-url");
const RESPONSE_DATE = document.querySelector("#response-date");
const RESPONSE_DURATION = document.querySelector("#response-duration");
const RESPONSE_COUNT = document.querySelector("#response-count");
const APPEARANCE_URL_COUNT = document.querySelector("#appearance-url-count");
const AVERAGE_FETCH_TIME = document.querySelector("#average-fetch-time");
const TOTAL_COUNT = document.querySelector("#total-count");
const TOTAL_ELEMENT_COUNT = document.querySelector("#total-element-count");
//need a cycle to fill date
const RESPONSE_ELEMENT_ARRAY = document.querySelectorAll(".response-element");
const DOMAIN_ARRAY = document.querySelectorAll(".domain");
//show results div
const RESPONSE_DIV = document.querySelector(".response");
//we use this function to get data from form
function submitForm(data) {
	timeStart = timePoint();
	if (!data) {
		url = document.querySelector("#url").value.trim();
		element = document.querySelector("#element").value.trim();
		data = { url, element };
	}
	//1. send data to server
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
			//2. then we check if there was NO a request to the target site in last 5 mins
			if (response.isNotActual) {
				//3. there was no - so we need to do a new one
				sendData();
			} else {
				//4. after we did a new request to target site and get all data from server we can fill the data
				fillResult(response);
			}
		})
		.catch((error) => {
			alert("Error: " + error.message);
		});
}
function sendData() {
	//this function do request to target site and returns all needed stats for record into a db
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
//search for all tag's appearance in html
function findAllOccurrences(mainString, subString) {
	//mainString - it's a respose's body with all html
	let occurrences = 0;
	// we add '<' so we can serach only for tags, but if we romove '<' we could search for any text, not just tags
	const formatedSubString = "<" + subString;
	let index = -1;
	do {
		index = mainString.indexOf(formatedSubString, index + 1);
		if (index !== -1) occurrences++;
	} while (index !== -1);

	return occurrences;
}
//fill results using response from db
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
//this function just create a new time point. It's neccery to calculate duration of whole opperation
function timePoint() {
	return new Date();
}
//calculate duration
function calculateTime() {
	return timePoint() - timeStart;
}
//just to follow pattern from your example
function formatDate(date) {
	return date.replace(/-/g, "/");
}

//use this functions when you need to fill all elements with certain CSS class with the same data
function fillMultipleResults(elementsToFill, elment) {
	elementsToFill.forEach((item) => (item.textContent = elment));
}
