const express = require('express');
const bodyParser = require('body-parser')


const app = express()

app.use(bodyParser.json())
app.set('view engine', 'ejs')
app.set('views', __dirname + "/views")


// app.use('/users', require('./routes/users'));
app.use('/login', require('./routes/login'));

const port = process.env.PORT || 4000

app.listen(port, () => {
    console.log('app on');
})
 