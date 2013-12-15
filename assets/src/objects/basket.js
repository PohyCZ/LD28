// Generated by CoffeeScript 1.6.3
(function() {
  window.Basket = (function() {
    function Basket(game, gameScene) {
      this.game = game;
      this.gameScene = gameScene;
      this.phase = this.gameScene.phase;
      this.items = [];
      this.funds = 100000000;
      this.selectBarWidth = 64;
      this.selectBarPos = this.game.width / 2 - this.selectBarWidth / 2;
    }

    Basket.prototype.update = function() {
      var item, _i, _len, _ref, _results;
      switch (this.phase) {
        case 0:
          _ref = this.gameScene.items;
          _results = [];
          for (_i = 0, _len = _ref.length; _i < _len; _i++) {
            item = _ref[_i];
            if (this.game.keys.keyPressed(32)) {
              _results.push(this.buy(this.currentItem));
            } else {
              _results.push(void 0);
            }
          }
          return _results;
      }
    };

    Basket.prototype.render = function() {
      var item, _i, _len, _ref, _results;
      switch (this.phase) {
        case 0:
          this.selectBar();
          this.game.util.drawText(this.funds, 10, this.game.height - 5);
          if (this.game.debug) {
            _ref = this.items;
            _results = [];
            for (_i = 0, _len = _ref.length; _i < _len; _i++) {
              item = _ref[_i];
              _results.push(this.game.util.drawText(item.name, this.game.width - 50, this.game.height - 5 - (_i * 10)));
            }
            return _results;
          }
      }
    };

    Basket.prototype.buy = function(item) {
      if (this.itemIsBuyable(item)) {
        if (this.debug) {
          console.log("added " + item.name + " to basket");
        }
        this.items.push(item);
        this.gameScene.items.splice(this.gameScene.items.indexOf(item), 1);
        return this.funds -= item.price;
      }
    };

    Basket.prototype.itemIsBuyable = function(item) {
      if (item === void 0) {
        return false;
      }
      if (item.x <= this.selectBarPos + this.selectBarWidth && item.x + item.sprite.width >= this.selectBarPos && item.price <= this.funds) {
        console.log("buyable");
        return true;
      } else {
        return false;
      }
    };

    Basket.prototype.selectBar = function() {
      var item, selectBarActiveAlpha, selectBarAlpha, selectBarInactiveAlpha, _i, _len, _ref;
      selectBarInactiveAlpha = 0.3;
      selectBarActiveAlpha = 0.5;
      selectBarAlpha = selectBarInactiveAlpha;
      _ref = this.gameScene.items;
      for (_i = 0, _len = _ref.length; _i < _len; _i++) {
        item = _ref[_i];
        if (this.itemIsBuyable(item)) {
          selectBarAlpha = selectBarActiveAlpha;
        } else {
          selectBarAlpha = selectBarInactiveAlpha;
        }
      }
      return this.game.util.drawRect(this.selectBarPos, 0, this.selectBarWidth, this.game.height, "#fff", selectBarAlpha);
    };

    return Basket;

  })();

}).call(this);
