const pool = require("./db.js");
const queries = require("./queries.js");

const getStudents = (req, res) => {
    pool.query(queries.getStudents, (error, results) => {
        
        if (error) throw error;
        res.status(200).json(results.rows);
    });
};

const insert = (insertdata) => {

    var data = insertdata.split("@");

    if (data.length === 4) {
        const Pool = require("pg").Pool;

        const pool = new Pool({
            host: "localhost",
            user: "postgres",
            port: 5432,
            password: "a35749374",
            database: "cloud"
        });

        var queryletter =`INSERT INTO students(articlenumber, name, day, quantity) VALUES ($1, $2, $3, $4)`;
        pool.query(queryletter, data, (err, res) => {
        console.log(err ? err.stack : res.rows)
        })
    }

}


module.exports = {
    getStudents,
    insert,
};