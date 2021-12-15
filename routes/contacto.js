var express = require('express');
var router = express.Router();

//muestra la vista
router.get('/', function(req,res,next){
    res.render('contacto', { 
        isContacto: true
       });//contacto.hbs
})

//funcionamiento del formulario
router.post('/', async function(req, res, next) {

});
module.exports=router;