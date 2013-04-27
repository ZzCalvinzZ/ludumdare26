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

            shape = new lime.RoundedRect()
            shape.setSize newBase , 50
            shape.setFill 33, 55, 45
            shape.setPosition 512, (775 - (718 / amount * num))

            goog.events.listen shape, ['mouseover'], (e) ->

                e.target.runAction(new lime.animation.Spawn(
                    new lime.animation.FadeTo(.8).setDuration(.2),
                    new lime.animation.ScaleTo(1.1).setDuration(.3)
                ))


                e.swallow ['mouseout'], ->
                    e.target.runAction(new lime.animation.Spawn(
                        new lime.animation.FadeTo(1).setDuration(.2),
                        new lime.animation.ScaleTo(1).setDuration(.3)
                    ))
                    e.release()



            @appendChild shape


