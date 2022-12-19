const express = require("express");
const app = express();
const cors = require("cors");
const pool = require('./db');
const PORT = 3500;

app.use(cors());
app.use(express.json());

app.get("/UserList", async (req, res) => {
  try {
    const users = await pool.query("SELECT * FROM Users ORDER BY UserName ASC;");
    res.json(users.rows);
  } catch (error) {
    console.error(error.message);
  }
});

app.get("/AllTransactions", async (req, res) => {
  try {
    const users = await pool.query(
      "SELECT * FROM UserTransactions ORDER BY 1 DESC;"
    );
    res.json(users.rows);
  } catch (error) {
    console.error(error.message);
  }
});

app.get("/UserList/:id", async (req, res) => {
  try {
    const {id} = req.params;
    const users = await pool.query("SELECT * FROM Users WHERE UserId = $1;", [id ]);
    res.json(users.rows[0]);
  } catch (error) {
    console.error(error.message);
  }
});

app.listen(PORT, () => {
  console.log("Your server is running on port:", PORT);
});
