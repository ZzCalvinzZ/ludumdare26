goog.provide 'game.Enemy'

#get requirements
goog.require 'game'
goog.require 'lime.Sprite'
goog.require 'game.Object'

class game.Enemy extends game.Object

    constructor: (options) ->
        super
        @_shape.setFill 0,100,0

    updateFromBody: ->
