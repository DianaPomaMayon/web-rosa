const Servicio = require("../models/servicio");

class ServicioController{

    async listarServicio(req,res){
        try{
            const servicioData = await Servicio.find();
            return res.json(servicioData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al Listar las servicio"
            });
        }
    }

    async crearServicio(req,res){
        try{
            const servicioData = await Servicio.create(req.body);
            return res.json(servicioData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al crear la servicio"
            });
        }
    }

    async borrarServicio(req,res){
        try{
            const servicioData = await Servicio.deleteOne(req.body);
            return res.json(servicioData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al borra la servicio"
            });
        }
    }
}

module.exports =new ServicioController();