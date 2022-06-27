const MovingObject = require("./moving_object.js");
const Util = require("./utils.js");



function Asteroid(options) {
  options ||= {}
  options.color = "#000000";
  options.radius = 25;
  options.vel = Util.randomVec(20)
  MovingObject.call(this, options)
}

Util.inherits(Asteroid, MovingObject)


// let asteroid = new Asteroid({ pos: [30, 30] });
module.exports = Asteroid;