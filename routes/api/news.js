const router = require("express").Router();

router.get("/", async (req, res) => {
  res.json({
    data: "this is news route",
  });
});

//TO DO: Add routes of different functionality

module.exports = router;
