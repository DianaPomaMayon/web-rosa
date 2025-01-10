const mongoose = require("mongoose");

const ServicioSchema = new mongoose.Schema(
    {
        nombreServicio: {
            type: String,
            required: true,
            
        },
        // imagenServicio: {
        //     type: String,
        //     required: false
        // }
    }
    
);
module.exports = mongoose.model("servicio",ServicioSchema);