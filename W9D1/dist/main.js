/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	var __webpack_modules__ = ({

/***/ "./src/asteroid.js":
/*!*************************!*\
  !*** ./src/asteroid.js ***!
  \*************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Util = __webpack_require__(/*! ./utils.js */ \"./src/utils.js\");\r\n\r\n\r\n\r\nfunction Asteroid(options) {\r\n  options ||= {}\r\n  options.color = \"#000000\";\r\n  options.radius = 25;\r\n  options.vel = Util.randomVec(20)\r\n  MovingObject.call(this, options)\r\n}\r\n\r\nUtil.inherits(Asteroid, MovingObject)\r\n\r\n\r\n// let asteroid = new Asteroid({ pos: [30, 30] });\r\nmodule.exports = Asteroid;\n\n//# sourceURL=webpack:///./src/asteroid.js?");

/***/ }),

/***/ "./src/game.js":
/*!*********************!*\
  !*** ./src/game.js ***!
  \*********************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\");\r\n\r\nfunction Game() {\r\n  this.DIM_X = 1000;\r\n  this.DIM_Y = 800;\r\n  this.NUM_ASTEROIDS = 20;\r\n}\r\n\r\nconst asteroids = [];\r\n\r\nGame.prototype.addAsteroids = function () {\r\n  for (let i = 0; i < this.NUM_ASTEROIDS; i++){\r\n    asteroids.push(\r\n      new Asteroid({pos: this.randomPosition()})\r\n    );\r\n  }\r\n  console.log(asteroids)\r\n};\r\n\r\nGame.prototype.randomPosition = function () {\r\n  return [Math.random()*this.DIM_X, Math.random()*this.DIM_Y]\r\n};\r\n\r\nGame.prototype.draw = function (ctx) {\r\n  for(let j = 0; j < asteroids.length; j++){\r\n    asteroids[j].draw(ctx);\r\n  }\r\n};\r\n\r\nGame.prototype.moveObjects = function () {\r\n  for (let h = 0; h < asteroids.length; h++){\r\n    let dx = (Math.random() * 2) - 1;\r\n    let dy = (Math.random() * 2) - 1;\r\n\r\n    asteroids[h].pos[0] += dx;\r\n    asteroids[h].pos[1] += dy;\r\n    // console.log(asteroids[h].pos)\r\n    // console.log(\"it is working\")\r\n  }\r\n};\r\n\r\nmodule.exports = Game;\r\n\n\n//# sourceURL=webpack:///./src/game.js?");

/***/ }),

/***/ "./src/game_view.js":
/*!**************************!*\
  !*** ./src/game_view.js ***!
  \**************************/
/***/ ((module, __unused_webpack_exports, __webpack_require__) => {

eval("let Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\r\n\r\nfunction GameView(ctx){\r\n  this.game = new Game();\r\n  this.ctx = ctx;\r\n}\r\n\r\nGameView.prototype.start = function(){\r\n  this.game.addAsteroids();\r\n  this.game.draw(this.ctx);\r\n  setInterval(() => {this.game.moveObjects()}, 20);\r\n  requestAnimationFrame(this.anime.bind(this))\r\n}\r\n\r\nGameView.prototype.anime = function(time){\r\n\r\n}\r\n\r\n\r\nmodule.exports = GameView;\n\n//# sourceURL=webpack:///./src/game_view.js?");

/***/ }),

/***/ "./src/index.js":
/*!**********************!*\
  !*** ./src/index.js ***!
  \**********************/
/***/ ((__unused_webpack_module, __unused_webpack_exports, __webpack_require__) => {

eval("const MovingObject = __webpack_require__(/*! ./moving_object.js */ \"./src/moving_object.js\");\r\nconst Asteroid = __webpack_require__(/*! ./asteroid.js */ \"./src/asteroid.js\")\r\nconst Game = __webpack_require__(/*! ./game.js */ \"./src/game.js\")\r\nconst GameView = __webpack_require__(/*! ./game_view.js */ \"./src/game_view.js\")\r\n\r\nwindow.MovingObject = MovingObject;\r\nwindow.Game = Game;\r\n\r\nwindow.addEventListener('DOMContentLoaded', function() {\r\n  console.log('DOM fully loaded and parsed');\r\n  const canvas = document.getElementById(\"game-canvas\");\r\n  canvas.height = 800;\r\n  canvas.width = 1000;\r\n  const ctx = canvas.getContext(\"2d\");\r\n  \r\n\r\n  let game = new GameView(ctx);\r\n  game.start();\r\n});\n\n//# sourceURL=webpack:///./src/index.js?");

/***/ }),

/***/ "./src/moving_object.js":
/*!******************************!*\
  !*** ./src/moving_object.js ***!
  \******************************/
/***/ ((module) => {

eval("function MovingObject(options) {\r\n    this.pos = options.pos;\r\n    this.vel = options.vel;\r\n    this.radius = options.radius;\r\n    this.color = options.color;\r\n}\r\n\r\n// const mo = new MovingObject({\r\n//   pos: [30, 30],\r\n//   vel: [10, 10],\r\n//   radius: 5,\r\n//   color: \"#00FF00\"\r\n// });\r\n\r\nMovingObject.prototype.draw = function(ctx){\r\n  ctx.fillStyle = this.color;\r\n  ctx.beginPath();\r\n\r\n  ctx.arc(\r\n    this.pos[0],\r\n    this.pos[1],\r\n    this.radius,\r\n    0,\r\n    2 * Math.PI,\r\n    false\r\n  );\r\n\r\n  ctx.fill();\r\n}\r\n\r\nMovingObject.prototype.move = function() {\r\n    this.pos[0] += this.vel[0];\r\n    this.pos[1] += this.vel[1];\r\n}\r\n\r\nmodule.exports = MovingObject;\r\n\r\n\r\n\r\n\r\n\n\n//# sourceURL=webpack:///./src/moving_object.js?");

/***/ }),

/***/ "./src/utils.js":
/*!**********************!*\
  !*** ./src/utils.js ***!
  \**********************/
/***/ ((module) => {

eval("\r\n\r\n\r\nconst Util = {\r\n  randomVec(length) {\r\n    const deg = 2 * Math.PI * Math.random();\r\n    return Util.scale([Math.sin(deg), Math.cos(deg)], length);\r\n  },\r\n  scale(vec, m) {\r\n    return [vec[0] * m, vec[1] * m];\r\n  },\r\n  inherits(childClass, parentClass) {\r\n    function Surrogate(){};\r\n    Surrogate.prototype = parentClass.prototype;\r\n    childClass.prototype = new Surrogate();\r\n    childClass.prototype.constructor = childClass;\r\n  }\r\n};\r\n\r\n\r\n\r\nmodule.exports = Util;\n\n//# sourceURL=webpack:///./src/utils.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/index.js");
/******/ 	
/******/ })()
;