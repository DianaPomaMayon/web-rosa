const Promocion = require("../models/promociones");

class PromocionController{

    //Listar promociones
    async listarPromocion(req,res){
        try{
            const promocionesData = await Promocion.find();
            return res.json(promocionesData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al Listar las promociones"
            });
        }
    }

    // Crear promociones
    async crearPromocion(req,res){
        try{
            const promocionesData = await Promocion.create(req.body);
            return res.json(promocionesData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al crear la promocione"
            });
        }
    }

    // Borrar promociones
    async borrarPromocion(req,res){
        try{
            const promocionesData = await Promocion.deleteOne(req.body);
            return res.json(promocionesData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al borra las promocione"
            });
        }
    }
}

module.exports =new PromocionController();