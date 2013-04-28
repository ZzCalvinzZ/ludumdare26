goog.provide 'game.GameScene'

#get requirements
goog.require 'game.Object'
goog.require 'game.Player'
goog.require 'game.Enemy'


class game.GameScene extends lime.Sprite

    constructor: ->
        lime.Sprite.call @
        @init()

    init: ->
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
            friction: 0

        ground = new game.Object
            x: game.WIDTH /2
            y: game.HEIGHT - game.HEIGHT/4
            width: game.WIDTH
            height: 10
            friction: 0
            rotation: 0

        ground._shape.setFill 155,155,155

        @appendChild ground._shape
        @appendChild player1._shape
        @appendChild enemy._shape

        game.worldObjects.push ground
        game.worldObjects.push player1




