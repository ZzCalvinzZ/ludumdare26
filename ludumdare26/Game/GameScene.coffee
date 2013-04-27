goog.provide 'game.GameScene'

#get requirements


class game.GameScene extends lime.Sprite

    constructor: ->
        lime.Sprite.call @
        @drawWorld()

    drawWorld: ->
        layer = new lime.Layer()

        @appendChild layer