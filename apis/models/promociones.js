const mongoose = require("mongoose");

const PromocionSchema = new mongoose.Schema(
    {
        nombrePromocion: {
            type: String,
            required: true,
        },
        precio: {
            type: String,
            required: true
        },
        contiene: {
            type: String,
            required: true
        }
    }
);
module.exports = mongoose.model("promociones",PromocionSchema);