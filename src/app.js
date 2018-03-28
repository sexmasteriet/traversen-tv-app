import { greet } from "./hello_world/hello_world";

var Elm = require("../elm/Main");
var container = document.getElementById("app");
var app = Elm.Main.embed(container);

app.ports.greet.send(greet());