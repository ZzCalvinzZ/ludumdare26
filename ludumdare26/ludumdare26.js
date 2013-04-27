(function() {
  var myscene;

  goog.provide('game');

  goog.require('lime.Director');

  goog.require('lime.Scene');

  goog.require('lime.Layer');

  goog.require('lime.Circle');

  goog.require('lime.Label');

  goog.require('lime.animation.Spawn');

  goog.require('lime.animation.FadeTo');

  goog.require('lime.animation.ScaleTo');

  goog.require('lime.animation.MoveTo');

  goog.require('lime.transitions.SlideInRight');

  goog.require('lime.transitions.Dissolve');

  goog.require('game.TitleScreen');

  goog.require('game.Player');

  myscene = null;

  game.start = function() {
    game.director = new lime.Director(document.body, 1024, 768);
    game.titleScreen();
    return myscene = scene;
  };

  game.switchScene = function(sceneContents, transition, duration) {
    var layer, scene;
    scene = new lime.Scene();
    layer = new lime.Layer();
    scene.appendChild(layer);
    layer.appendChild(sceneContents);
    return game.director.replaceScene(scene, transition, duration);
  };

  game.titleScreen = function() {
    var scene, transition;
    scene = new game.TitleScreen();
    transition = lime.transitions.Dissolve;
    return game.switchScene(scene, transition, .5);
  };

  game.startGame = function(mode) {
    return game.switchScene(myscene, lime.transitions.SlideInRight, .5);
  };

  goog.exportSymbol('game.start', game.start);

}).call(this);
