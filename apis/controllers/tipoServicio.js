const TipoServicio = require("../models/tipoServicio");

class TipoServicioController{

    async listarTipoServicio(req,res){
        try{
            const tipoServicioData = await TipoServicio.find();
            return res.json(tipoServicioData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al Listar las tipoServicio"
            });
        }
    }

    async crearTipoServicio(req,res){
        try{
            const tipoServicioData = await TipoServicio.create(req.body);
            return res.json(tipoServicioData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al crear la tipoServicio"
            });
        }
    }

    async borrarTipoServicio(req,res){
        try{
            const tipoServicioData = await TipoServicio.deleteOne(req.body);
            return res.json(tipoServicioData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al borra las tipoServicio"
            });
        }
    }
}

module.exports =new TipoServicioController();