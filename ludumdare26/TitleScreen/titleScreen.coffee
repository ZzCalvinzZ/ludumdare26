goog.provide 'game.TitleScreen'

#get requirements
goog.require 'lime.Circle'

class game.TitleScreen extends lime.Sprite

    constructor: ->
        lime.Sprite.call @
        @draw()
        console.log 'hello'

    draw: ->
        shape = new lime.Circle()
        shape.setSize 700, 200
        shape.setFill 255, 150, 0


