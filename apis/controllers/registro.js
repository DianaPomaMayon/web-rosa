const bcrypt = require("bcrypt");
const Registro = require("../models/registro");
const Perfil = require("../models/perfil");

class RegistroController {
    async crearRegistro(req, res) {
        try {
            const salt = await bcrypt.genSalt(10);
            const hashedPassword = await bcrypt.hash(req.body.password, salt);

            const registroData = await Registro.create({
                nombre: req.body.nombre,
                celular: req.body.celular,
                password: hashedPassword
            });
            const perfilData = {
                nombre: registroData.nombre,
                celular: registroData.celular
            };
            await Perfil.create(perfilData);

            return res.json(registroData);
        } catch (err) {
            res.status(500).send({
                message: err.message || "Error al registrar"
            });
        }
    }

    async listarRegistro(req, res) {
        try {
            const registroData = await Registro.find();
            return res.json(registroData);
        } catch (err) {
            res.status(500).send({
                message: err.message || "Error al Listar los registros"
            });
        }
    }
}

module.exports = new RegistroController();