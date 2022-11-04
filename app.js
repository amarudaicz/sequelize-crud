const express = require('express');
const app = express()
const bodyParser = require('body-parser')

app.use(bodyParser.json())


app.use('/', require('./routes/users'));



app.listen(3080, ( )=> {
    console.log('app on');
})