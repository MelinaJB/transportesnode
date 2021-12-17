var createError = require('http-errors');
var express = require('express');
var path = require('path');
var cookieParser = require('cookie-parser');
var logger = require('morgan');

require('dotenv').config();
var session = require('express-session');

var indexRouter = require('./routes/index');
var nosotrosRouter = require('./routes/nosotros') //nosotros.js
var serviciosRouter = require('./routes/servicios'); // servicios.js
var galeriaRouter = require('./routes/galeria');//galeria.js
var novedadesRouter = require('./routes/novedades');//novedades.js
var contactoRouter = require('./routes/contacto');//contacto.js
var loginRouter = require('./routes/admin/login');//admin/login.js
var adminNovedadesRouter = require('./routes/admin/novedades');//admin/novedades.js
/*const res = require('express/lib/response');*/

var app = express();

// view engine setup
app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'hbs');

app.use(logger('dev'));
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.use(cookieParser());
app.use(express.static(path.join(__dirname, 'public')));


app.use(session({
  secret: 'melinajoloidovskybor',
  resave: false,
  saveUninitialized: true,
  cookie: { maxAge: 600000} //se le pone uno grande para trabajar dsp se puede modificar
}))

secured = async function(req, res, next){
  try{
    console.log(req.session.id_usuario);
    if(req.session.id_usuario){
      next()
    }else{
      res.redirect('/admin/login')
    }
  }catch(error){
    console.log(error)
  }
}

app.use('/', indexRouter);//linea10
app.use('/nosotros', nosotrosRouter); //linea 11
app.use('/servicios', serviciosRouter); //linea 12
app.use('/galeria', galeriaRouter); //linea 13
app.use('/novedades', novedadesRouter); //linea 14
app.use('/contacto', contactoRouter); //linea 15
app.use('/admin/login', loginRouter);//linea 16
app.use ('/admin/novedades', secured, adminNovedadesRouter);//linea 17

// catch 404 and forward to error handler
app.use(function(req, res, next) {
  next(createError(404));
});

// error handler
app.use(function(err, req, res, next) {
  // set locals, only providing error in development
  res.locals.message = err.message;
  res.locals.error = req.app.get('env') === 'development' ? err : {};

  // render the error page
  res.status(err.status || 500);
  res.render('error');
});

module.exports = app;
