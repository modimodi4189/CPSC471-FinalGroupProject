const Dish = require("../models/dish.model.js");

// Get dish by restaurandID and menu name
exports.findOne = (req, res) => {
    const RID = req.params.RestaurantID;

    Dish.findByRestaurantID(RID, (err, data) => {
        if (err) {
            if (err.kind === "not_found") {
                res.status(404).send({
                    message: `Not found Account with id .`
                });
            } else {
                res.status(500).send({
                    message: "Error retrieving Account with restaurant id: " + RID 
                });
            }
        } else res.send(data);
    });
};
