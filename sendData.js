export default function sendData(data) {
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
			fillResult(response);
		})
		.catch((error) => {
			console.error("Error:", error);
		});
}
