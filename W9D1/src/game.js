const MovingObject = require("./moving_object.js");
const Asteroid = require("./asteroid.js");

function Game() {
  this.DIM_X = 1000;
  this.DIM_Y = 800;
  this.NUM_ASTEROIDS = 20;
}

const asteroids = [];

Game.prototype.addAsteroids = function () {
  for (let i = 0; i < this.NUM_ASTEROIDS; i++){
    asteroids.push(
      new Asteroid({pos: this.randomPosition()})
    );
  }
  console.log(asteroids)
};

Game.prototype.randomPosition = function () {
  return [Math.random()*this.DIM_X, Math.random()*this.DIM_Y]
};

Game.prototype.draw = function (ctx) {
  for(let j = 0; j < asteroids.length; j++){
    asteroids[j].draw(ctx);
  }
};

Game.prototype.moveObjects = function () {
  for (let h = 0; h < asteroids.length; h++){
    let dx = (Math.random() * 2) - 1;
    let dy = (Math.random() * 2) - 1;

    asteroids[h].pos[0] += dx;
    asteroids[h].pos[1] += dy;
    // console.log(asteroids[h].pos)
    // console.log("it is working")
  }
};

module.exports = Game;
