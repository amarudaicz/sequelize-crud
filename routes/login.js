const express = require('express'); //REQUERIMOS EXPRES PARA MODER ACCEDER A SU FUNCIONALIDAD.
const router = express.Router(); //INSTANCIAMOS LA VARIABLE ROUTER PARA PODER HACER LAS RUTAS MAS DINAMICAS Y MODULARES.(hacer esto nos permite poder llamar a las rutas desde app.js)











router.get('/', (req, res) => {
  res.json({
    name: 'Amaru',
    lastname: 'Daicz',
    rol: 'user',
  });
});


module.exports = router;
