const Pool = require("pg").Pool;

const pool = new Pool({
    host: "localhost",
    user: "postgres",
    port: 5432,
    password: "a35749374",
    database: "cloud"
});


module.exports = pool