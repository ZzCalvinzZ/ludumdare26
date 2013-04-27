goog.provide 'pong.Game'

#get requirements
goog.require 'lime.Circle'
goog.require 'lime.Label'
goog.require 'lime.RoundedRect'
goog.require 'lime.Sprite'
goog.require 'lime.animation.FadeTo'
goog.require 'lime.fill.LinearGradient'
goog.require 'pong.Notice'
goog.require 'pong.Player'
goog.require 'lime.audio.Audio'

class game.Game

    constructor: ->
        @.drawWorld()

    drawWorld: ->
        background = new lime.Layer()
        platforms = new lime.Layer()
        ladders = new lime.Layer()

        sky = new lime.Sprite()
        sky.setSize

        background.appendChild sky