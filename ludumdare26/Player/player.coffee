goog.provide 'game.Player'

#get requirements
goog.require 'lime.Sprite'

class game.Player extends lime.Sprite

	constructor: ->
        lime.Sprite.call @
        @draw()

    draw: ->

    	player = new lime.Circle()
    	player.setSize 40,40
    	player.setFill 0,100,0
    	player.setPosition 500,500  

    	@appendChild player