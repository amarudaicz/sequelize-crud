const express = require('express');
const bodyParser = require('body-parser')


const app = express()

app.use(bodyParser.json())


// app.use('/users', require('./routes/users'));
app.use('/login', require('./routes/login'));



app.listen(3080, () => {
    console.log('app on');
})
