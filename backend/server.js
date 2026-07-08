const express = require("express");
const mongoose = require("mongoose");
const cors = require("cors");
require("dotenv").config();

const app = express();

app.use(cors());
app.use(express.json());

mongoose.connect(process.env.MONGO_URL);

const User = mongoose.model("User", {
    name: String
});

app.get("/users", async (req, res) => {
    const users = await User.find();
    res.json(users);
});

app.post("/users", async (req, res) => {
    const user = new User({
        name: req.body.name
    });

    await user.save();

    res.json(user);
});

app.listen(5000, () => {
    console.log("Backend running...");
});