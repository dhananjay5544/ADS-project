const express = require("express");
const helmet = require("helmet");
const morgan = require("morgan");
const newsRoute = require("./routes/api/news");
const middlewares = require("./routes/api/middlewares");
const app = express();

require("dotenv").config();

// security middlewares
app.use(helmet());
app.use(morgan("combined"));
app.use(express.json());

app.get("/", authenticate, function (req, res) {
	res.json({
		message: "✨✨...Welcome to News API...✨✨",
		requestedAt: new Date(),
	});
});

function authenticate(req, res, next) {
	const header = req.headers["authorization"];
	const apikey = header && header.split(" ")[1];
	if (apikey !== process.env.API_KEY) {
		res.status(401).json({
			message: "🚫Unauthorised Access....",
			requestedAt: new Date(),
		});
	} else {
		next();
	}
}

// routes middlewares
app.use("/api/news", newsRoute);

app.use(middlewares.notFound);
app.use(middlewares.errorHandler);

const PORT = process.env.PORT;
app.listen(PORT, () => console.log(`Server running on port ${PORT}.....`));
