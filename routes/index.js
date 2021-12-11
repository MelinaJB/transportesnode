var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: 'Batatini' });
});//res render me muestra el archivo hbs q es index

module.exports = router;
