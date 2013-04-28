goog.provide 'game.GameScene'

#get requirements
goog.require 'game.Object'
goog.require 'game.Player'
goog.require 'game.Enemy'
goog.require 'game.ObjectHelper'


class game.GameScene extends lime.Sprite

    constructor: ->
        lime.Sprite.call @
        @oh = new game.ObjectHelper(@)
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

            x: game.WIDTH / 3
            y: game.HEIGHT - 30
            width: game.WIDTH * 3
            height: 30
        ground._shape.setFill 100,45,35


        @appendChild ground._shape
        @appendChild player1._shape
        @appendChild enemy._shape

        game.worldObjects.push ground
        game.worldObjects.push player1
        game.worldObjects.push enemy


    moveWorld: ->
       # @setPosition @getPosition().x - 1, @getPosition().y




