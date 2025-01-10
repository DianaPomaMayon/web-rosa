const mongoose = require("mongoose");

const TipoServicioSchema = new mongoose.Schema(
    {
        nombreTipoServicio: {
            type: String,
            required: true,
        },
        precio: {
            type: String,
            required: true
        },
        tiempo: {
            type: String,
            required: true
        }
    }
);
module.exports = mongoose.model("tipoServicio",TipoServicioSchema);