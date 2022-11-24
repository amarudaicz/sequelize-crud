
const express = require('express'); //REQUERIMOS EXPRES PARA MODER ACCEDER A SU FUNCIONALIDAD.
const router = express.Router(); //INSTANCIAMOS LA VARIABLE ROUTER PARA PODER HACER LAS RUTAS MAS DINAMICAS Y MODULARES.(hacer esto nos permite poder llamar a las rutas desde app.js)

const userModel = require('../models').users //REQUERIMOS EL MODELO DE USERS PARA ACCEDER A SUS FUNCIONES Y PODER MANEJAR LA DB



//RUTA PARA OBTENER TODOS LOS USERS
router.get('/get-all', async (req, res )=>{
    
    const users = await userModel.findAll({}) //OBTENEMOS TODOS LOS REGISTROS DE LA DB CON LA FUNCION findAll() de userModel

    res.send(users)//RESPONDEMOS CON TODOS LOS USERS DE LA TABLA

})



//RUTA PARA UN SOLO USER PASANDO POR PARAMS(URL) EL ID
router.get('/get-one/:id', async (req, res ) => {

    try {
    
        const {id} = req.params //EXTRAEMOS DE LA REQUEST EL ID QUE VIENE EN EL URL(usando metodo destructuring)

        const user = await userModel.findOne({//OBTENEMOS EL USER CON LA FUNCION findOne() DE userModel QUE SE LE PASA COMO PARAMETRO UN OBJETO DONDE PODEMOS ESPECIFICAR LOS PARAMETROS DE LA BUSQUEDA
            
            attributes:['id', 'name'], //attributes SON LAS COLUMNAS QUE QUEREMOS "TRAER" DE LA TABLA users (DE NUESTRA DB) 
            where: {id: id} // where INDICA EN ESTE CASO QUE EL ID DE LA TABLA users SEA IGUAL AL ID QUE RECIBIMOS POR PARAMS, PODRIAMOS BUSCAR TAMBIEN POR EMAIL userModel.findOne(where{email:'asd@asd.com'}) (usar este metodo de sequelize seria equivalente a hacer una consulta SQL SELECT * FROM users WHERE id = 'ALGUN ID')
        
        }) 
        
        if (!user) return res.send('Not user') //SI NO ENCUENTRA NINGUN USER EN LA DB LA FUNCION findOne(...) DEVUELVE COMO VALOR NULL Y CON UN if PODEMOS RESPONDER CON UN ERROR Y STATUS
        
        res.send(user) //SI NO ENTRA EN EL IF DE (!user) SIGE LA EJECUCION Y RESPONDEMOS CON EL USER QUE ENCONTRO (por el id)
        
    } catch (err) {
        res.send({error:err})
    }
})


//RUTA PARA INSERTAR UN USUARIO
router.post('/post-one', async (req, res )=>{

    try {
        const {name, email, password} = req.body //EXTRAEMOS DE req.body => name, email, password(usando metodo destructuring) QUE SON LOS DATOS QUE DEBEMOS ENVIAR DESDE EL FRONT SEA CON UN FORMULARIO O DE OTRAS MANERAS.(usamos postman o insomnia para simular este proceso)

        const newUser = await userModel.create({name:name, email:email, password:password }) //CON userModel.create(...) CREAMOS UN NUEVO REGISTRO(FILA) EN LA DB CON LOS DATOS QUE "VIAJAN" EN req.body(name, email, password), DEBEMOS PASAR A LA FUNCION ESTOS DATOS COMO OBJETO DE JS. (SE PUEDE PASAR SOLO EL NOMBRE DE LA PROPIEDAD DEL OBJETO DE ESTA FORMA {name, email, password}) Y EL RESULTADO ES EL MISMO.
        
        res.send(newUser) //RESPONDEMOS CON EL NUEVO USER

    } catch (err) {
        console.log(err);
        res.send({error:err})
    }

})


//RUTA PARA ELIMINAR UN USUARIO
router.delete('/delete-one/:id', async (req, res )=>{

    try {
        const {id} = req.params //EXTRAEMOS DE LA REQUEST EL ID QUE VIENE EN EL URL (usando metodo destructuring)

        const user = await userModel.destroy({where:{id:id}}) //ELIMINAMOS DE LA DB CON userModel.destroy(...) DONDE EL ID SEA IGUAL AL ID QUE VIENE EN LA URL
        
        if (!user) return res.send({error:'Not user'}) //SI EL USER NO EXISTE RETORNAMOS UNA RESPUESTA('Not User')    

        res.json(user) //SI EXISTE RETORNAMOS CON EL USER, QUE EN ESTE CASO SERIA LA RESPUESTA DE LA DB(con sequelize), QUE CUANDO SE ELIMINA UN REGISTRO LA RESPUESTA ES 1 
        
    } catch (err) {
        console.log(err);
        res.send({error:err})
    }

})




//RUTA PARA ACTUALIZAR UN USUARIO
router.put('/update-one/:id', async (req, res )=>{

    try {
        const {id} = req.params //EXTRAEMOS DE LA REQUEST EL ID QUE VIENE EN EL URL (usando metodo destructuring)

        const {name, email, password} = req.body //EXTRAEMOS DE req.body => name,email,password QUE SON LOS DATOS TIENEN QUE "VIAJAN" EN EL BODY DE LA REQUEST

        const user = await userModel.update(
            { 
                name:name, email:email, password:password //COMO PRIMER PARAMETRO DE LA FUNCION userModel.update(...) PASAMOS EL OBJETO CON LAS PROPIEDADES A ACTUALIZAR 
            },
            {
                where: {
                    id:id //COMO SEGUNDO PARAMETRO UN OBJETO DONDE INDICAMOS CUAL ES EL USER QUE DEBE ACTUALIZAR, EN ESTE CASO ES EL USER QUE EL id SEA IGUAL AL id QUE VIENE EN LA URL 
                }
            }

        );

        console.log(user);
        if (!user[0]) return res.send({error:'Not user'}) //SI EL USER NO EXISTE RETORNAMOS UNA RESPUESTA('Not User'), ACA ALIJO LA POCISION 0 DE USER PORQUE LA RESPUESTA DE LA DB ES => [0] OSEA UN ARRAY CON EL NUMERO CERO DENTRO (hacer log)
        
        res.send(user) //SI EXISTE RETORNAMOS CON EL USER, QUE EN ESTE CASO SERIA LA RESPUESTA DE LA DB(con sequelize), QUE CUANDO SE EDITA UN REGISTRO LA RESPUESTA ES 1, PODRIAMOS RESPONDER CON ALGO MAS ESPECIFICO.
 
    } catch (err) {
        console.log(err);
        res.send({error:err})

    }

})
 


module.exports = router