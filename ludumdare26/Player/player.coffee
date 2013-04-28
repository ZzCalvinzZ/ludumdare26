goog.provide 'game.Player'

#get requirements
goog.require 'game'
goog.require 'lime.Sprite'
goog.require 'game.Object'

goog.require 'box2d.Vec2'

class game.Player extends game.Object

    constructor: (options) ->
        super(options)
        @_shape.setFill 0,100,0
        
    updateVelocity: (y)->
        vel = new box2d.Vec2 0,y
        @_body.ApplyForce(new box2d.Vec2(0,-200), @_body.GetCenterPosition())



    inputListen: ->
        that = this
        goog.events.listen window, [goog.events.EventType.KEYDOWN], (e) ->
            switch e.keyCode
                when 37 
                    that.updateVelocity -30
                when 39 
                    that.updateVelocity 500
