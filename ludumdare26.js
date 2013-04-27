//set main namespace
goog.provide('ludumdare26');


//get requirements
goog.require('lime.Director');
goog.require('lime.Scene');
goog.require('lime.Layer');
goog.require('lime.Circle');
goog.require('lime.RoundedRect')
goog.require('lime.Label');
goog.require('lime.animation.Spawn');
goog.require('lime.animation.FadeTo');
goog.require('lime.animation.ScaleTo');
goog.require('lime.animation.MoveTo');


// entrypoint
ludumdare26.start = function(){

	var director = new lime.Director(document.body,1024,768);

	var scene = new lime.Scene();
	var gameScene = new lime.Scene();
	var layer = new lime.Layer();
	var shape = new lime.RoundedRect().setSize(400,200).setRadius(50).setPosition(300,150);

	scene.appendChild(layer);
	layer.appendChild(shape);
	shape.setFill(100,0,0);
	director.replaceScene(scene);
	//director.replaceScene(gameScene,lime.transitions.Dissolve,2)


}
//this is required for outside access after code is compiled in ADVANCED_COMPILATIONS mode
goog.exportSymbol('ludumdare26.start', ludumdare26.start);
