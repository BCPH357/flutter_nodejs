const getStudents = "SELECT * FROM students";
const insert = `INSERT INTO students(articlenumber, name, day, quantity) VALUES ($1, $2, $3, $4)`;
const deletedata = 'DELETE FROM "students" WHERE "articlenumber" = $1 AND "name" = $2';


module.exports = {
    getStudents,
    insert,
    deletedata,
};