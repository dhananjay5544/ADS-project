const router = require("express").Router();
const mysql = require("mysql");
const { config } = require("../config/dbConfig");

var pool = mysql.createPool(config);

var connection = () => {
	return new Promise((resolve, reject) => {
		pool.getConnection((err, connection) => {
			if (err) throw err;
			resolve(connection);
		});
	});
};

// Get all news
router.get("/", async (req, res, next) => {
	try {
		const query = "CALL getAllNews();";
		const db = await connection();
		db.query(query, function (err, result) {
			if (err) throw err;
			res.json({
				data: result,
			});
		});
	} catch (error) {
		next(error);
	}
});

//get all news with category type
router.get("/cat", async (req, res, next) => {
	try {
		const query = "CALL getCategoryDis();";
		const db = await connection();
		db.query(query, function (err, result) {
			if (err) throw err;
			res.json({
				data: result,
			});
		});
	} catch (error) {
		next(error);
	}
});

// Get  all categories
router.get("/categories", async (req, res, next) => {
	try {
		const query = "CALL getCategories();";
		const db = await connection();
		db.query(query, function (err, result) {
			if (err) throw err;
			res.json({
				data: result,
				"Total categories": result[0].length,
			});
		});
	} catch (error) {
		next(error);
	}
});

// Get news by categories
router.get("/:Id", async (req, res, next) => {
	try {
		const query = `CALL getNewsByCategory(${req.params.Id});`;
		const db = await connection();
		db.query(query, function (err, result) {
			if (err) throw err;
			res.json({
				data: result,
			});
		});
	} catch (error) {
		next(error);
	}
});

// Add new news Entry
router.post("/addNews", async (req, res, next) => {
	try {
		const query = `CREATE EVENT IF NOT EXISTS news_event${Math.floor(
			Math.random() * 100 + 1
		)} ON SCHEDULE at '${
			req.body.schedules_time
		}' DO INSERT INTO news(imageUrl,title,description,source,date,categoryId,status) VALUES('${
			req.body.imageUrl
		}','${req.body.title}','${req.body.description}','${
			req.body.source
		}',current_timestamp(),${req.body.categoryId},${req.body.status})`;
		const db = await connection();
		db.query(query, function (err, result) {
			if (err) throw err;
			res.json({
				data: `News has been Scheduled on ${req.body.schedules_time}`,
			});
		});
	} catch (error) {
		next(error);
	}
});

// Add new news Entry
router.post("/updateNews/:id", async (req, res, next) => {
	try {
		let params = [];
		if (req.body.title) {
			params.push("title=" + `'${req.body.title}'`);
		}
		if (req.body.description) {
			params.push("description=" + `'${req.body.description}'`);
		}
		const query = `UPDATE news SET ${params.join(",")} WHERE newsId=${
			req.params.id
		}`;
		const db = await connection();
		db.query(query, function (err, result) {
			if (err) throw err;
			res.json({
				msg: `News has been updated🚀`,
			});
		});
	} catch (error) {
		next(error);
	}
});

//TO DO: Add routes of different functionality

module.exports = router;
