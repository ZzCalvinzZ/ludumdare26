// Generated by CoffeeScript 1.3.3
(function() {
  var __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  goog.provide('game.TitleScreen');

  goog.require('lime.RoundedRect');

  goog.require('game');

  game.TitleScreen = (function(_super) {

    __extends(TitleScreen, _super);

    function TitleScreen() {
      lime.Sprite.call(this);
    }

    TitleScreen.prototype.draw = function() {
      var amount, base, newBase, num, shape, tiles, _i, _results,
        _this = this;
      tiles = [];
      amount = 10;
      base = 900;
      _results = [];
      for (num = _i = amount; amount <= 1 ? _i <= 1 : _i >= 1; num = amount <= 1 ? ++_i : --_i) {
        newBase = base - Math.sqrt(num) * 270;
        shape = new lime.RoundedRect();
        shape.setSize(newBase, 50);
        shape.setFill(33, 55, 45);
        shape.setPosition(512, 775 - (718 / amount * num));
        if (num === 5) {
          shape.setFill(100, 45, 35);
          goog.events.listen(shape, ['click'], function(e) {
            game.startGame();
            return _this.flyOut(tiles);
          });
        }
        goog.events.listen(shape, ['mouseover', 'click'], function(e) {
          e.target.runAction(new lime.animation.Spawn(new lime.animation.FadeTo(1.2).setDuration(.2), new lime.animation.ScaleTo(1.15).setDuration(.1)));
          return e.swallow(['mouseout'], function() {
            e.target.runAction(new lime.animation.Spawn(new lime.animation.FadeTo(1).setDuration(.2), new lime.animation.ScaleTo(1).setDuration(.3)));
            return e.release();
          });
        });
        tiles.push(shape);
        _results.push(this.appendChild(shape));
      }
      return _results;
    };

    TitleScreen.prototype.flyOut = function(tiles) {
      var duration, tile, _i, _len, _results;
      duration = .3;
      _results = [];
      for (_i = 0, _len = tiles.length; _i < _len; _i++) {
        tile = tiles[_i];
        tile.runAction(new lime.animation.MoveTo(0, tile.getPosition().y).setDuration(duration));
        _results.push(duration += duration);
      }
      return _results;
    };

    return TitleScreen;

  })(lime.Sprite);

}).call(this);
