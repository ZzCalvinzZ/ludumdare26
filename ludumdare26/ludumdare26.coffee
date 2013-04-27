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

goog.require('box2d.BodyDef');
goog.require('box2d.BoxDef');
goog.require('box2d.CircleDef');
goog.require('box2d.CircleShape');
goog.require('box2d.PolyDef');
goog.require('box2d.Vec2');
goog.require('box2d.JointDef');
goog.require('box2d.MouseJointDef');
goog.require('box2d.World');

#Game requirements
goog.require 'game.TitleScreen'
goog.require 'game.GameScene'
goog.require 'game.Player'
goog.require 'game.Object'
goog.require 'game.Bottom'
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
        for item in game.worldObjects
            item.updateFromBody()

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
    transition = lime.transitions.Dissolve

    game.switchScene(scene, transition, 2)


game.startGame = (mode) ->
    scene = new game.GameScene()
    game.switchScene scene, lime.transitions.SlideInRight, 1

    enemy = new game.Enemy
        x: 20
        y: 20
        width: 20
        height: 20

    player1 = new game.Player
        x: 300
        y: game.HEIGHT /2
        width: 50
        height: 50
        density: 2


    ground = new game.Object
        x: game.WIDTH /2
        y: game.HEIGHT - game.HEIGHT/4
        width: game.WIDTH
        height: game.HEIGHT / 4

    ground._shape.setFill 155,155,155

    scene.appendChild ground._shape
    scene.appendChild player1._shape
    scene.appendChild enemy._shape

    game.worldObjects.push ground
    game.worldObjects.push player1
    #game.worldObjects.push enemy

#this is required for outside access after code is compiled in ADVANCED_COMPILATIONS mode
goog.exportSymbol('game.start', game.start)
