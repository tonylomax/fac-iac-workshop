import express from "express";

const app = express();
const port = 3000;

app.get("/", (req, res) => {
  console.log("i am at the root of the api :)");
  res.send("Hello World!");
});

app.get("/health-check", (req, res) => {
  console.log("i'm the health check");
  try {
    console.log("everything looks good");
    res.send(200);
  } catch (error) {
    console.error("something went wrong :(");
    res.send(500);
  }
});

app.listen(port, () => {
  console.log(`Example app listening on port ${port}`);
});
