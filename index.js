var app = require('express')();

app.get("/", (req, res) => {
    res.json({
        "key":"Value"
    })

});

app.listen(3000,(req, res) => {
    console.log(3000);
});