#set main namespace
goog.provide 'game'

#get requirements
goog.require 'lime.Director'
goog.require 'lime.Scene'
goog.require 'lime.Layer'
goog.require 'lime.Circle'
goog.require 'lime.Label'
goog.require 'lime.animation.Spawn'
goog.require 'lime.animation.FadeTo'
goog.require 'lime.animation.ScaleTo'
goog.require 'lime.animation.MoveTo'
goog.require 'lime.transitions.SlideInRight'
goog.require 'lime.transitions.Dissolve'

#Game requirements
goog.require 'game.TitleScreen'
goog.require 'game.Player'

# entrypoint
game.start = ->

    #lime.scheduleManager.setDisplayRate(1000 / 60)

    game.director = new lime.Director(document.body,1024,768)

    game.titleScreen()

game.switchScene = (sceneContents, transition, duration) ->
    scene = new lime.Scene()
    layer = new lime.Layer()

    scene.appendChild layer
    layer.appendChild sceneContents

    game.director.replaceScene(scene, transition, duration)

game.titleScreen = ->

    scene = new game.TitleScreen()
    transition = lime.transitions.Dissolve

    game.switchScene(scene, transition, .5)

game.startGame = (mode) ->
    #game.switchScene myscene, lime.transitions.SlideInRight, .5



#this is required for outside access after code is compiled in ADVANCED_COMPILATIONS mode
goog.exportSymbol('game.start', game.start)
