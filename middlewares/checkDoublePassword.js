






function checkDoublePassword(req, res, next) {

    const primerPassword = req.body.primerPassword
    const segundoPassword = req.body.segundoPassword

    if (primerPassword === segundoPassword) {   

        next()      
        
    }else{      
        res.send({error:'la contraseña no son iguales'})
    }


}