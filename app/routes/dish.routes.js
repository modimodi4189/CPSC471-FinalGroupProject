
module.exports = app => {
    const dish = require("../controllers/dish.controller.js");

    var router = require("express").Router();

    // Retrieve dish by menu and restaurant ID
    router.get("/:RestaurantID/", dish.findOne);

    app.use('/api/dish', router);
};
