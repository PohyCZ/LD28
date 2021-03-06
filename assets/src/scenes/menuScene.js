// Generated by CoffeeScript 1.6.3
(function() {
  window.MenuScene = (function() {
    function MenuScene(game) {
      this.game = game;
      this.buttonPlay = new Button(this.game.width / 2, this.game.height / 2, 80, 50, "Play", this.actionPlay, this.game);
    }

    MenuScene.prototype.update = function() {
      return this.buttonPlay.update();
    };

    MenuScene.prototype.render = function() {
      return this.buttonPlay.render();
    };

    MenuScene.prototype.actionPlay = function() {
      return this.game.activeScene = this.game.gameScene;
    };

    return MenuScene;

  })();

}).call(this);
