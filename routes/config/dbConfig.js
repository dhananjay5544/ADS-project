require("dotenv").config();

module.exports.config = {
  user: process.env.USER,
  password: process.env.PASSWORD,
  connectString: process.env.CONNECTION_HOST,
  poolMax: 250,
};
