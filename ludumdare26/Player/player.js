(function() {
  var __hasProp = Object.prototype.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor; child.__super__ = parent.prototype; return child; };

  goog.provide('game.Player');

  goog.require('lime.Sprite');

  game.Player = (function(_super) {

    __extends(Player, _super);

    function Player() {
      lime.Sprite.call(this);
      this.draw();
    }

    Player.prototype.draw = function() {
      var player;
      player = new lime.Circle();
      player.setSize(40, 40);
      player.setFill(0, 100, 0);
      player.setPosition(500, 500);
      return this.appendChild(player);
    };

    return Player;

  })(lime.Sprite);

}).call(this);
