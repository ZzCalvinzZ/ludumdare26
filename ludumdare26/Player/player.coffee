goog.provide 'game.Player'

#get requirements

goog.require 'lime.Sprite'

class game.Player extends lime.Sprite

	constructor: ->
        lime.Sprite.call @
        @draw()

    draw: ->

    	player = new game.Object
    		x: 400
    		y: 500
    		width: 50
    		height: 50

    	player._shape.setFill 0,100,0

    