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

goog.require 'box2d.BodyDef'
goog.require 'box2d.BoxDef'
goog.require 'box2d.CircleDef'
goog.require 'box2d.CircleShape'
goog.require 'box2d.PolyDef'
goog.require 'box2d.Vec2'
goog.require 'box2d.JointDef'
goog.require 'box2d.MouseJointDef'
goog.require 'box2d.World'

#Game requirements
goog.require 'game.TitleScreen'
goog.require 'game.GameScene'
goog.require 'game.Player'
goog.require 'game.Object'
goog.require 'game.Enemy'

game.worldObjects = []

# entrypoint
game.start = ->
    @WIDTH = 1024
    @HEIGHT = 768
    game.director = new lime.Director(document.body,game.WIDTH,game.HEIGHT)
    game.world = setupWorld()
    game.titleScreen()

    lime.scheduleManager.schedule (dt) ->
        game.world.Step(dt / 1000, 3)
        game.scene.moveWorld() if game.scene?
        for item in game.worldObjects
            item.updateFromBody()
            if (item.inputListen) 
                item.inputListen() 


setupWorld = ->
    gravity = new box2d.Vec2(0, 200)
    bounds = new box2d.AABB()
    bounds.minVertex.Set -game.WIDTH, -game.HEIGHT
    bounds.maxVertex.Set 2*game.WIDTH, 2*game.HEIGHT
    new box2d.World(bounds, gravity, true)


game.switchScene = (sceneContents, transition, duration) ->
    scene = new lime.Scene()
    layer = new lime.Layer()

    scene.appendChild layer
    layer.appendChild sceneContents

    game.director.replaceScene(scene, transition, duration)

game.titleScreen = ->

    scene = new game.TitleScreen()
    transition = lime.transitions.SlideInRight

    game.switchScene(scene)
    scene.draw()


game.startGame = (mode) ->
    scene = new game.GameScene()
    game.scene = scene
    game.switchScene scene, lime.transitions.SlideInRight, 3


#this is required for outside access after code is compiled in ADVANCED_COMPILATIONS mode
goog.exportSymbol('game.start', game.start)
