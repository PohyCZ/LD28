// Generated by CoffeeScript 1.6.3
(function() {
  window.onload = function() {
    var game;
    window.Game = (function() {
      function Game(canvasId) {
        var activeScene, debug, gameScene, stats;
        this.debug = debug = true;
        this.includeScripts();
        if (this.debug) {
          console.log("-------------------------");
        }
        this.context = document.getElementById(canvasId).getContext("2d");
        this.width = $(canvasId).attr("width");
        this.height = $(canvasId).attr("height");
        if (this.debug) {
          stats = this.initStats();
        }
        this.util = new Util(this);
        gameScene = new GameScene(this);
        this.activeScene = activeScene = gameScene;
        setInterval(function() {
          if (debug) {
            stats.begin();
          }
          activeScene.update();
          activeScene.render();
          if (debug) {
            return stats.end();
          }
        }, 1000 / this.fps);
      }

      Game.prototype.includeScripts = function() {
        var script, url, urls, _i, _len, _results;
        urls = ["objects/item.js", "scenes/gameScene.js", "utils/util.js"];
        _results = [];
        for (_i = 0, _len = urls.length; _i < _len; _i++) {
          url = urls[_i];
          script = document.createElement("script");
          script.type = "text/javascript";
          script.src = "assets/src/" + url;
          $("head").append(script);
          if (this.debug) {
            _results.push(console.log("loaded " + url));
          } else {
            _results.push(void 0);
          }
        }
        return _results;
      };

      Game.prototype.initStats = function() {
        var stats;
        stats = new Stats();
        stats.setMode(0);
        stats.domElement.style.position = "absolute";
        stats.domElement.style.left = "0px";
        stats.domElement.style.top = "0px";
        document.body.appendChild(stats.domElement);
        return stats;
      };

      return Game;

    })();
    return game = new Game("canvas");
  };

}).call(this);