const pool = require("./db.js");
const queries = require("./queries.js");

const getStudents = (req, res) => {
    pool.query(queries.getStudents, (error, results) => {
        
        if (error) throw error;
        res.status(200).json(results.rows);
    });
};

const insert = async (insertdata) => {
    var data = insertdata.split("@");

    if (data.length === 4 && data[0] != "" && data[1] != "" && data[2] != "" && data[3] != "") {

        try {

            await pool.query(queries.insert, data); // sends queries
            return true;
        } 

        catch (error) {
            console.error(error.stack);
            return false;
        } 
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

const edit = async (editData) => {
    var data = editData.split("@");

    if (data.length === 4 && data[0] != "" && data[1] != "") {    

        try {

            await pool.query(queries.edit, data); // sends queries
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
    edit,
};