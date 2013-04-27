goog.provide 'game.Enemy'

#get requirements
goog.require 'game'
goog.require 'lime.Sprite'
goog.require 'game.Object'

class game.Enemy extends game.Object
    x = 0;
    y = 0;

    constructor: (options) ->
        super
        @_shape.setFill 255,0,0
        options.x = options.x
        options.y = options.y

    updateFromBody: ->
        x++
        @_shape.setPosition x, 100
