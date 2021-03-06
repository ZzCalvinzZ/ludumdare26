goog.provide 'game.Object'

#get requirements
goog.require 'lime.fill.Fill'

class game.Object extends lime.Sprite

    constructor: (options) ->
        console.log options

        bodyDef = new box2d.BodyDef
        bodyDef.position.Set options.x, options.y
        bodyDef.rotation = options.rotation || 0

        shapeDef = new box2d.BoxDef
        shapeDef.restitution = options.restitution || 0
        shapeDef.density = options.density || 0
        shapeDef.friction = options.friction || 1;
        shapeDef.extents.Set options.width/2, options.height/2

        bodyDef.AddShape(shapeDef);
        @_body = game.world.CreateBody(bodyDef)

        @_shape = new lime.RoundedRect()
        @_shape.setPosition options.x, options.y
        @_shape.setSize options.width, options.height
        @_shape.setRotation options.rotation || 0

        if options.color?
            fill = new lime.fill.Fill
            fill.setCanvasStyle options.color
            @_shape.setFill options.color

    updateFromBody: ->
        @_shape.setPosition @_body.GetCenterPosition()
