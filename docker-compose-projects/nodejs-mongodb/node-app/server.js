const express = require("express");
const mongoose = require("mongoose");
const app = express();
const port = 3000;

mongoose.connect("mongodb://db:27017/mydb", {
  useNewUrlParser: true,
  useUnifiedTopology: true,
});

const Item = mongoose.model("Item", new mongoose.Schema({ name: String }));

app.get("/", async (req, res) => {
  const item = new Item({ name: "Docker User" });
  await item.save();
  const count = await Item.countDocuments();
  res.send(`Hello! Total items in DB: ${count}`);
});

app.listen(port, () => console.log(`App running on http://localhost:${port}`));