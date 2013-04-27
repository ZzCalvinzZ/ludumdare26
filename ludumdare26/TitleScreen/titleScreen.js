(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  goog.provide('game.TitleScreen');

  goog.require('lime.RoundedRect');

  goog.require('game');

  game.TitleScreen = (function(_super) {

    __extends(TitleScreen, _super);

    function TitleScreen() {
      lime.Sprite.call(this);
      this.draw();
    }

    TitleScreen.prototype.draw = function() {
      var amount, base, layer, newBase, num, shape;
      layer = new lime.Layer();
      amount = 10;
      base = 900;
      for (num = amount; amount <= 1 ? num <= 1 : num >= 1; amount <= 1 ? num++ : num--) {
        newBase = base - Math.sqrt(num) * 270;
        shape = new lime.RoundedRect();
        shape.setSize(newBase, 50);
        shape.setFill(33, 55, 45);
        shape.setPosition(512, 775 - (718 / amount * num));
        if (num === 5) {
          shape.setFill(100, 45, 35);
          goog.events.listen(shape, ['click'], function(e) {
            return game.startGame();
          });
        }
        layer.appendChild(shape);
        goog.events.listen(shape, ['mouseover'], function(e) {
          e.target.runAction(new lime.animation.Spawn(new lime.animation.FadeTo(1.2).setDuration(.2), new lime.animation.ScaleTo(1.15).setDuration(.1)));
          return e.swallow(['mouseout'], function() {
            e.target.runAction(new lime.animation.Spawn(new lime.animation.FadeTo(1).setDuration(.2), new lime.animation.ScaleTo(1).setDuration(.3)));
            return e.release();
          });
        });
        layer.appendChild(shape);
      }
      return this.appendChild(layer);
    };

    return TitleScreen;

  })(lime.Sprite);

}).call(this);
