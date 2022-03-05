
module.exports = app => {
    const account = require("../controllers/account.controller.js");

    var router = require("express").Router();

    // Create a new account
    router.post("/", account.create);

    // Retrieve all accounts
    router.get("/", account.findAll);

    // Retrieve account by Email_ID
    router.get("/:Email_ID", account.findOne);


    app.use('/api/account', router);
};
