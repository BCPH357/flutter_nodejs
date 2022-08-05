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
        pool.query(queries.insert, data, (err, res) => {
        console.log(err ? err.stack : res.rows)
        })
    }
}

const deletedata = async (msg) => {
    var data = msg.split("@");

    if (data.length === 2) {    

        try {

            await pool.query(queries.deletedata, data); // sends queries
            return true;
        } 

        catch (error) {
            console.error(error.stack);
            return false;
        } 
    }
};


module.exports = {
    getStudents,
    insert,
    deletedata,
};