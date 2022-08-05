const getStudents = "SELECT * FROM students";
const insert = `INSERT INTO students(articlenumber, name, day, quantity) VALUES ($1, $2, $3, $4)`;
const deletedata = 'DELETE FROM "students" WHERE "articlenumber" = $1 AND "name" = $2';
const edit = 'UPDATE "students" SET "day" = $1, "quantity" = $2 WHERE "articlenumber" = $3 AND "name" = $4';


module.exports = {
    getStudents,
    insert,
    deletedata,
    edit,
};