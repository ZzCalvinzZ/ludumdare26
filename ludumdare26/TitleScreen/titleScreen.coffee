goog.provide 'game.TitleScreen'

#get requirements
goog.require 'lime.RoundedRect'

class game.TitleScreen extends lime.Sprite

    constructor: ->
        lime.Sprite.call @
        @draw()

    draw: ->

        amount = 10
        base = 900
        for num in [amount..1]
            newBase = base - Math.sqrt(num) * 270
            console.log newBase

            shape = new lime.RoundedRect()
            shape.setSize newBase , 50
            shape.setFill 33, 55, 45
            shape.setPosition 512, (775 - (718 / amount * num))
            shape.setPosition
            @appendChild shape


