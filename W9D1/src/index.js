const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js")
const Game = require("./game.js")
const GameView = require("./game_view.js")

window.MovingObject = MovingObject;
window.Game = Game;

window.addEventListener('DOMContentLoaded', function() {
  console.log('DOM fully loaded and parsed');
  const canvas = document.getElementById("game-canvas");
  canvas.height = 800;
  canvas.width = 1000;
  const ctx = canvas.getContext("2d");
  

  let game = new GameView(ctx);
  game.start();
});