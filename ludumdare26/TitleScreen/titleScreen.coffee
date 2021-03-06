goog.provide 'game.TitleScreen'

#get requirements
goog.require 'lime.RoundedRect'
goog.require 'game'

class game.TitleScreen extends lime.Sprite

    constructor: ->
        lime.Sprite.call @

    draw: ->
        tiles = []

        amount = 10
        base = 900
        for num in [amount..1]
            newBase = base - Math.sqrt(num) * 270

            shape = new lime.RoundedRect()
            shape.setSize newBase , 50
            shape.setFill 33, 55, 45
            shape.setPosition 3024, (775 - (718 / amount * num))

            # Begin Game Menu Item
            if num is 5
                shape.setFill 100, 45, 35

                goog.events.listen shape, ['click'], (e) =>
                    game.startGame()
                    @fly('out',tiles)


            goog.events.listen shape, ['mouseover', 'click'], (e) ->

                e.target.runAction(new lime.animation.Spawn(
                    new lime.animation.FadeTo(1.2).setDuration(.3),
                    new lime.animation.ScaleTo(1.15).setDuration(.1)
                ))


                e.swallow ['mouseout'], ->
                    e.target.runAction(new lime.animation.Spawn(
                        new lime.animation.FadeTo(1).setDuration(.2),
                        new lime.animation.ScaleTo(1).setDuration(.3)
                    ))
                    e.release()

            tiles.push shape
            @appendChild shape
        @fly('in', tiles)

    fly: (type, tiles) ->
        i = 0
        runAnim = ->
            if type == 'in'
                animation = new lime.animation.MoveTo(512, tiles[i].getPosition().y).setDuration(.1)
            else if type == 'out'
                animation = new lime.animation.MoveTo(0, tiles[i].getPosition().y).setDuration(.1)
            tiles[i++].runAction(animation)
            goog.events.listen animation,lime.animation.Event.STOP, ->
                if i < tiles.length
                    runAnim()

        runAnim()







