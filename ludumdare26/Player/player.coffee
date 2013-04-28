goog.provide 'game.Player'

#get requirements
goog.require 'game'
goog.require 'lime.Sprite'
goog.require 'game.Object'

goog.require 'box2d.BodyDef'
goog.require 'box2d.BoxDef'
goog.require 'box2d.CircleDef'
goog.require 'box2d.CircleShape'
goog.require 'box2d.PolyDef'
goog.require 'box2d.Vec2'
goog.require 'box2d.JointDef'
goog.require 'box2d.MouseJointDef'
goog.require 'box2d.World'

class game.Player extends game.Object

    constructor: (options) ->
        super(options)
        @_shape.setFill 0,100,0
        
    updateVelocity: (x)->
        if x == 'jump' 
            #@_body.WakeUp()
            #console.log @_body.IsSleeping()
            #@_body.ApplyForce(vel, @_body.GetCenterPosition())
            console.log 'jump'         
        else 
            vel = new box2d.Vec2 x,0
            @_body.SetLinearVelocity (vel)


    inputListen: ->
        that = this
        goog.events.listen window, [goog.events.EventType.KEYDOWN], (e) ->
            switch e.keyCode
                when 37 
                    that.updateVelocity -400
                when 39 
                    that.updateVelocity 400
                when 32
                    that.updateVelocity 'jump'
