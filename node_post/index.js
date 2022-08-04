const cors = require("cors");
const express = require("express");
const studentRoutes = require('./routes.js');
const insert = require("./controller.js")
const app = express();
const port = 8000;
app.use(cors());

app.use(express.json());

app.get("/", (req, res) => {
    res.send("hello world");
})



app.use("/api/v1/students", studentRoutes);

//insert.insert()


app.post('/api/v1/students', function(req, res) {

    if (req.body.title === "insert") {
        insert.insert(req.body.name);
    }
    //console.log(req.body.tel);
});



app.listen(port, () => console.log(`Server listening at http://localhost:${port}`));

