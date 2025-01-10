const mongoose = require("mongoose");

const PerfilSchema = new mongoose.Schema(
    {
        nombre: {
            type: String,
            required: true,
        },
        celular: {
            type: String,
            required: true,
        },
    }
);
module.exports = mongoose.model("perfil",PerfilSchema);