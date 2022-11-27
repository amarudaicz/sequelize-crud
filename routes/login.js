const express = require('express'); //REQUERIMOS EXPRES PARA MODER ACCEDER A SU FUNCIONALIDAD.
const router = express.Router(); //INSTANCIAMOS LA VARIABLE ROUTER PARA PODER HACER LAS RUTAS MAS DINAMICAS Y MODULARES.(hacer esto nos permite poder llamar a las rutas desde app.js)
const userModel = require('../models').users









router.get('/', async (req, res) => {

 const newUser = await userModel.create({
    name: 'Amaru',
    email: 'Daicz@gmail.com',
    password: 'asddsa',
  });
  
  res.send(newUser)

});



router.get('/data', (req, res) => {
  
  res.render('index')

});



module.exports = router;