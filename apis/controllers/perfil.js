const Perfil = require("../models/perfil");

class PerfilController{

    async listarPerfil(req,res){
        try{
            const perfilData = await Perfil.find();
            return res.json(perfilData);
        }catch(err){
            res.status(500).send({
                message: err.message || "Error al Listar el perfil"
            });
        }
    }
}

module.exports =new PerfilController();