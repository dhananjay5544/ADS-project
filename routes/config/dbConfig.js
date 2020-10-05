require("dotenv").config();
module.exports.config = {
	host: process.env.CONNECTION_HOST,
	port: "3306",
	user: process.env.USER,
	password: process.env.PASSWORD,
	database: process.env.DATABASE,
	connectionLimit: 1000,
	queueLimit: 5000,
	waitForConnections: true,
};
