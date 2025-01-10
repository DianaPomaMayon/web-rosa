const express = require("express");
const mongoose = require("mongoose");
const db = require("./config");
const cors = require("cors");

class App {
    constructor() {
        this.express = express();
        this.database();
        this.middlewares();
        this.routes();

        this.express.listen(4001, () =>
            console.log("API ejecutando en el puerto 4001")
        );
    }

    async database() {
        await mongoose.connect(db.uri, { useNewUrlParser: true, useUnifiedTopology: true });
    }

    middlewares() {
        this.express.use(cors());
        this.express.use(express.json());
    }

    routes() {
        this.express.use(require("./routes"));
    }
}

module.exports = new App().express;