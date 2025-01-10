const mongoose =require("mongoose");

const RegistroSchema = new mongoose.Schema(
    {
        nombre: {
            type: String,
            required: true,
        },
        celular: {
            type: String,
            required: true,
        },
        password: {
            type: String,
            required: true,
        }
    }
);
module.exports = mongoose.model("registro",RegistroSchema);