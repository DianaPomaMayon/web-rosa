const express = require("express");
const promocion = require("./controllers/promociones");
const registro = require("./controllers/registro");
const perfil = require("./controllers/perfil");
const servicio = require("./controllers/servicio");
const tipoServicio = require("./controllers/tipoServicio");
const inicioSesionController = require("./controllers/InicioSesion");
const routes = express.Router();

//promocion
routes.get('/promocion',promocion.listarPromocion);
routes.post('/promocion',promocion.crearPromocion);
routes.delete('/promocion',promocion.borrarPromocion);

//registro
routes.post('/registro',registro.crearRegistro);
routes.get('/registro',registro.listarRegistro);

//perfil
routes.get('/perfil',perfil.listarPerfil);

// servicio
routes.get('/servicio',servicio.listarServicio);
routes.post('/servicio',servicio.crearServicio);
routes.delete('/servicio',servicio.borrarServicio);

//tipo servicio
routes.get('/tipoServicio',tipoServicio.listarTipoServicio);
routes.post('/tipoServicio',tipoServicio.crearTipoServicio);
routes.delete('/tipoServicio',tipoServicio.borrarTipoServicio);

//inicio de sesión
routes.post('/inicioSesionController', inicioSesionController.iniciarSesion); 

module.exports = routes;