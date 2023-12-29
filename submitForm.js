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

function submitForm() {
	timeStart = timePoint();

	url = document.querySelector("#url").value;
	element = document.querySelector("#element").value;

	fetch("processRequest.php", {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify({ url, element }),
	})
		.then((response) => response.json())
		.then((data) => {
			response = data;
			console.log(response);
			if (response.isNotActual) {
				console.log(response.isActual);
			} else {
				fillResult(response);
			}
		})
		.catch((error) => {
			console.error("Error:", error);
		});

	// fetch(url)
	// 	.then((response) => {
	// 		if (!response.ok) {
	// 			throw new Error(`HTTP error! Status: ${response.status}`);
	// 		}
	// 		return response.text();
	// 	})
	// 	.then((responseText) => {
	// 		const count = findAllOccurrences(responseText, element);
	// 		let duration = calculateTime();
	// 		let domain = new URL(url).hostname;
	// 		sendData({ url, element, count, duration, domain });
	// 	})
	// 	.catch((error) => {
	// 		console.error("Fetch error:", error);
	// 	});
}

function findAllOccurrences(mainString, subString) {
	let occurrences = 0;
	const formatedSubString = "<" + subString;
	let index = -1;
	do {
		index = mainString.indexOf(formatedSubString, index + 1);
		if (index !== -1) occurrences++;
	} while (index !== -1);

	return occurrences;
}

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

function timePoint() {
	return new Date();
}

function calculateTime() {
	return timePoint() - timeStart;
}

function formatDate(date) {
	return date.replace(/-/g, "/");
}

function sendData(data) {
	// Use the Fetch API to make an Ajax request
	fetch("processRequest.php", {
		method: "POST",
		headers: {
			"Content-Type": "application/json",
		},
		body: JSON.stringify(data),
	})
		.then((response) => response.json())
		.then((data) => {
			response = data;
			console.log(response);
			fillResult(response);
		})
		.catch((error) => {
			console.error("Error:", error);
		});
}

function fillMultipleResults(elementsToFill, elment) {
	elementsToFill.forEach((item) => (item.textContent = elment));
}
