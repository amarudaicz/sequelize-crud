const express = require('express'); //REQUERIMOS EXPRES PARA MODER ACCEDER A SU FUNCIONALIDAD.
const router = express.Router(); //INSTANCIAMOS LA VARIABLE ROUTER PARA PODER HACER LAS RUTAS MAS DINAMICAS Y MODULARES.(hacer esto nos permite poder llamar a las rutas desde app.js)
const userModel = require('../models').users
  



router.get('/', async (req, res) => {
  try {
    const newUser = await userModel.create({
       id:3,
       name: 'Amaru',
       email: 'Daicz@gmail.com',
       role:'user',
       password:'usasder',
       age: 12,
     });
     
    res.send(newUser)
    
  } catch (err) {
    res.send({error:"error en login"})
  }

});
 


router.get('/data', (req, res) => {
  
  res.render('index')

});



module.exports = router;