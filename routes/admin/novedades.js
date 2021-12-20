var express = require ('express');
var router = express.Router();
var novedadesModels = require('../../models/novedadesModels');
var util = require ('util');
var cloudinary = require('cloudinary').v2;
const uploader = util.promisify(cloudinary.uploader.upload);
const destroy = util.promisify(cloudinary.uploader.destroy);


//listado novedades
router.get('/', async function(req, res, next){

    var novedades = await novedadesModels.getNovedades();

    novedades = novedades.map(novedad => {
        if (novedad.img_id){
            const imagen = cloudinary.image(novedad.img_id,{
                width: 100,
                height: 100,
                crop: 'fill'
            });
            return{
                ...novedad,
                imagen
            }
        }else{
            return{
                ...novedad,
                imagen: ''
            }
        }
    });

    res.render('admin/novedades',{
        layout:'admin/layout',
        usuario: req.session.nombre, //para guardar nombre y que se vea en novedades.hbs
        novedades
    });
});

//vista del formulario agregar
router.get('/agregar', function(req, res, next){
    res.render('admin/agregar',{
        layout: 'admin/layout'
    })
});

//da funcionamiento al boton guardar
router.post('/agregar', async (req, res, next) =>{
    try{
        var img_id ='';
        if(req.files && Object.keys(req.files).length > 0){
            imagen = req.files.imagen;
            img_id = (await uploader (imagen.tempFilePath)).public_id;
        }

        if(req.body.titulo != "" && req.body.subtitulo !="" && req.body.cuerpo !=""){
            //await novedadesModels.insertNovedad(req.body);
            await novedadesModels.insertNovedad({
                ...req.body,
                img_id
            })
            res.redirect('/admin/novedades');
        }else{
            res.render('admin/agregar', {
                layout: 'admin/layout',
                error:true,
                message: 'Todos los campos son requeridos'
            })
        }
    }catch(error){
        console.log(error);
        res.render('admin/agregar', {
            layout: 'admin/layout',
            error: true,
            message: 'No se cargo la novedad'
        })
    }
})

//funcionamiento de eliminar

router.get('/eliminar/:id', async (req, res, next)=>{
    var id = req.params.id; //captura del id 

    let novedad = await novedadesModels.getNovedadesByID(id);
    if(novedad.img_id){
        await (destroy(novedad.img_id));
    }
    
    await novedadesModels.deteleNovedadByID(id);
    res.redirect('/admin/novedades');
})


//para que me muestre modificar (vista) cargado con una novedad
router.get('/modificar/:id', async(req, res, next) =>{
    var id = req.params.id;
    var novedad = await novedadesModels.getNovedadesByID(id);
    res.render('admin/modificar', {
        layout: 'admin/layout',
        novedad
    })
})

//para el update
router.post('/modificar', async(req, res, next)=>{
    //console.log(req.body)
    try{

        let img_id = req.body.img_original;
        let borrar_img_vieja = false;
        if(req.body.img_delete === "1"){
            img_id = null;
            borrar_img_vieja = true;
        }else{
            if(req.files && Object.keys(req.files).length >0){
                imagen = req.files.imagen;
                img_id = (await uploader(imagen.tempFilePath)).public_id;
                borrar_img_vieja = true;
            }
        }

        if(borrar_img_vieja && req.body.img_original){
            await (destroy(req.body.img_original))
        }

        var obj = {
            titulo: req.body.titulo,
            subtitulo: req.body.subtitulo,
            cuerpo: req.body. cuerpo,
            img_id
        }
        await novedadesModels.modificarNovedadByID(obj, req.body.id);
        res.redirect('/admin/novedades');
    }catch(error){
        console.log(error);
        res.render('admin/modificar',{
            layout:'admin/layout',
            error:true,
            message: 'No se modificó la novedad'
        })
    }
})

module.exports = router;