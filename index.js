const express = require("express");
const helmet = require("helmet");
const morgan = require("morgan");
const newsRoute = require("./routes/api/news");
const app = express();
const oracledb = require("oracledb");
const db_config = require("./routes/config/dbConfig");

// security middlewares
app.use(helmet());
app.use(morgan("combined"));

//connect to database
oracledb.createPool(db_config, (err, res) => {
  if (err) return console.log(err.message);
  console.log("Connected to DB...");
});

app.get("/", function (req, res) {
  res.json({
    message: "........Welcome to News API........",
    requestedAt: new Date(),
  });
});

// routes middlewares
app.use("/api/news", newsRoute);

app.listen(8080, () => console.log(`server running on port 8080.....`));
