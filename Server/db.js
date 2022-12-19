const Pool = require("pg").Pool;

const pool = new Pool({
    user: "lavina",
    password: "Lavina",
    host: "localhost",
    port: 5432,
    database: "loanshark"
});

module.exports = pool;