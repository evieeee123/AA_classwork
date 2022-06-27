let Game = require("./game.js")

function GameView(ctx){
  this.game = new Game();
  this.ctx = ctx;
}

GameView.prototype.start = function(){
  this.game.addAsteroids();
  this.game.draw(this.ctx);
  setInterval(() => {this.game.moveObjects()}, 20);
  requestAnimationFrame(this.anime.bind(this))
}

GameView.prototype.anime = function(time){

}


module.exports = GameView;