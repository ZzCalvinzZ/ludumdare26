#set main namespace
goog.provide 'game'

#get requirements
goog.require 'lime.Director'
goog.require 'lime.Scene'
goog.require 'lime.Layer'
goog.require 'lime.Circle'
goog.require 'lime.Label'
goog.require 'lime.animation.Spawn'
goog.require 'lime.animation.FadeTo'
goog.require 'lime.animation.ScaleTo'
goog.require 'lime.animation.MoveTo'

#Game requirements
goog.require 'game.TitleScreen'

# entrypoint
game.start = ->

    #lime.scheduleManager.setDisplayRate(1000 / 60)

    game.director = new lime.Director(document.body,1024,768)

    scene = new lime.Scene()
    target = new lime.Layer().setPosition(512,384)
    circle = new lime.Circle().setSize(150,150).setFill(255,150,0)
    lbl = new lime.Label().setSize(160,50).setFontSize(30).setText('TOUCH ME!')
    title = new lime.Label().setSize(800,70).setFontSize(60).setText('Now move me around!').setOpacity(0).setPosition(512,80).setFontColor('#999').setFill(200,100,0,.1)

    #add circle and label to target object
    target.appendChild(circle)
    target.appendChild(lbl)

    #add target and title to the scene
    scene.appendChild(target)
    scene.appendChild(title)

    game.director.makeMobileWebAppCapable()

    #add some interaction
    goog.events.listen target,['mousedown','touchstart'], (e) ->

        #animate
        target.runAction(new lime.animation.Spawn(
            new lime.animation.FadeTo(.5).setDuration(.2),
            new lime.animation.ScaleTo(1.5).setDuration(.8)
        ))

        title.runAction(new lime.animation.FadeTo(1))

        #let target follow the mouse/finger
        e.startDrag()

        #listen for end event
        e.swallow ['mouseup','touchend'], ->
            target.runAction(new lime.animation.Spawn(
                new lime.animation.FadeTo(1),
                new lime.animation.ScaleTo(1),
                new lime.animation.MoveTo(512,384)
            ))

            title.runAction(new lime.animation.FadeTo(0))

    # Set current scene active
    game.director.replaceScene(scene)
    game.titleScreen()

game.switchScene = (sceneContents, transition, duration) ->
    scene = new lime.Scene()
    layer = new lime.Layer()

    scene.appendChild layer
    layer.appendChild sceneContents

    game.director.replaceScene(scene, transition, duration)

game.titleScreen = ->

    scene = new game.TitleScreen()
    transition = lime.transitions.Dissolve

    game.switchScene(scene, transition, 2)

game.startGame = (mode) ->



#this is required for outside access after code is compiled in ADVANCED_COMPILATIONS mode
goog.exportSymbol('game.start', game.start)
