goog.provide 'game.Player'

#get requirements
goog.require 'game'
goog.require 'lime.Sprite'
goog.require 'game.Object'

class game.Player extends game.Object

    constructor: (options) ->
        super(options)
        @_shape.setFill 0,100,0
        

    