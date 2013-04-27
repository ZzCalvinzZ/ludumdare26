goog.provide 'game.Player'

#get requirements
goog.require 'box2d.BodyDef'
goog.require 'box2d.BoxDef'
goog.require 'box2d.CircleDef'
goog.require 'box2d.CircleShape'
goog.require 'box2d.PolyDef'
goog.require 'box2d.Vec2'
goog.require 'box2d.JointDef'
goog.require 'box2d.MouseJointDef'
goog.require 'box2d.World'

goog.require 'lime.Sprite'

class game.Player extends lime.Sprite

	constructor: ->
        lime.Sprite.call @
        @draw()

    draw: (x,y) ->

    	player = new lime.Sprite()
    	player.setSize 40,40
    	player.setFill 0,100,0
    	player.setPosition 500,500  

    	@appendChild player

    	bodyDef = new box2d.BoxDef
    	bodyDef.position.Set(x,y)

    	var shapeDef = new box2d.BoxDef
       	shapeDef.restitution = 0
       	shapeDef.density = 5
       	shapeDef.friction = 1
       	shapeDef.extents.Set 40/2,40/2

       	bodyDef.AddShape shapeDef

       	