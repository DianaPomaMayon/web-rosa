const Registro = require("../models/registro");
const bcrypt = require("bcrypt");

class InicioSesionController {
    async iniciarSesion(req, res) {
        try {
            const { celular, password } = req.body;

            const registro = await Registro.findOne({ celular });
            if (!registro) {
                return res.status(400).send({ message: "Número de celular o contraseña incorrectos" });
            }

            const isMatch = await bcrypt.compare(password, registro.password);
            if (!isMatch) {
                return res.status(400).send({ message: "Número de celular o contraseña incorrectos" });
            }

            res.status(200).json({
                message: "Inicio de sesión exitoso",
                _id: registro._id,
                nombre: registro.nombre,
                celular: registro.celular,
            });

        } catch (err) {
            res.status(500).send({
                message: err.message || "Error al iniciar sesión"
            });
        }
    }
}

module.exports = new InicioSesionController();