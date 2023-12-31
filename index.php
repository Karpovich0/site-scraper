<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<title>HTML Element Counter</title>
		<!-- fonts -->
		<link rel="preconnect" href="https://fonts.googleapis.com" />
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
		<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet" />
		<!-- styles -->
		<link rel="stylesheet" href="./css/drop-default-styles.min.css" />
		<link rel="stylesheet" href="./css/normalize.min.css" />
		<link rel="stylesheet" href="./css/style.css" />
	</head>
	<body>
		<main class="main">
			<section>
				<!-- section for form -->
				<h1>HTML Element Counter</h1>
				<form id="elementForm" action="" onsubmit="event.preventDefault(); submitForm()">
					<div class="row">
						<label for="url">URL:</label>
						<input
							type="text"
							id="url"
							name="url"
							required
							placeholder="https://example.com"
							minlength="5"
							pattern="^(https?|ftp):\/\/[^\s\/$.?#].[^\s]*$"
						/>
					</div>
					<div class="row">
						<label for="element">Element:</label>
						<input
							type="text"
							id="element"
							name="element"
							placeholder="img"
							pattern="[A-Za-z0-9]+"
							required
							minlength="1"
						/>
					</div>
					<button type="submit">Count</button>
					<!-- END section for form -->
				</form>
			</section>
			<div id="responseArea" class="response">
				<section>
					<!-- statistic about current request -->
					<h2>Statistic</h2>
					<div class="response__row">
						URL: <span id="response-url"></span> Fetched on <span id="response-date"></span>, took
						<span id="response-duration">000</span> msec.
					</div>
					<div class="response__row">
						Element: &lt;<span class="response-element"></span>&gt; appeared
						<span id="response-count"></span> time(s) in page
					</div>
					<!-- END statistic about current request -->
				</section>
				<section>
					<!-- general statistic -->
					<h2>General Statistics</h2>
					<div class="response__row">
						<span id="appearance-url-count">X</span> different URLs from <span class="domain">X</span> have
						been fetched<br />
					</div>

					Average fetch time from <span class="domain">X</span> during the last <span>24 hours</span> hours is
					<span id="average-fetch-time">X</span> ms
					<div class="response__row"></div>
					There was a total of <span id="total-count"></span> &lt;<span class="response-element"></span>&gt;
					elements from <span class="domain">X</span> Total of
					<span id="total-element-count">X</span> &lt;<span class="response-element"></span>&gt; elements
					counted in all requests ever made
					<!-- END general statistic -->
				</section>
			</div>
		</main>
		<script src="./submitForm.js"></script>
	</body>
</html>
