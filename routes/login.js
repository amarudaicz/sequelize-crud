const express = require('express'); //REQUERIMOS EXPRES PARA MODER ACCEDER A SU FUNCIONALIDAD.
const router = express.Router(); //INSTANCIAMOS LA VARIABLE ROUTER PARA PODER HACER LAS RUTAS MAS DINAMICAS Y MODULARES.(hacer esto nos permite poder llamar a las rutas desde app.js)
const request = require('request');










router.get('/', (req, res) => {
  res.json({
    name: 'Amaru',
    lastname: 'Daicz',
    rol: 'user',
  });
});



router.get('/data', (req, res) => {
  const name = 'golden retriever';
  request.get({
    url: 'https://api.api-ninjas.com/v1/dogs?name=' + name,
    headers: {
      'X-Api-Key': 'nq+4R1C5cuxmV6gnFS5jnw==SxbXrtG6qPlQ1wTW'
    },
  }, function(error, response, body) {
    if(error) return console.error('Request failed:', error);
    else if(response.statusCode != 200) return console.error('Error:', response.statusCode, body.toString('utf8'));
    else res.json(body)
  });
});



module.exports = router;