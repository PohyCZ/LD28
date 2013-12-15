class window.Basket
	constructor: (@game, @gameScene) ->
		@phase = @gameScene.phase

		@items = []
		@funds = 100000000

		@selectBarWidth = 64
		@selectBarPos = @game.width / 2 - @selectBarWidth / 2

	update: ->
		switch @phase
			when 0
				for @item in @gameScene.items
					if @game.keys.keyPressed(32)
						@buy(@item)
			when 1

	render: ->
		switch @phase
			when 0
				@selectBar()
				@game.util.drawText(@funds, 10, @game.height - 5)
				if @game.debug
					for item in @items
						@game.util.drawText(item.name, @game.width - 50, @game.height - 5 - (`_i`*10))
			when 1


	buy: (item) ->
		if @itemIsBuyable(item)
			if @game.debug
				console.log("added #{item.name} to basket")
			@items.push(item)
			@gameScene.items.splice(@gameScene.items.indexOf(item), 1)
			@funds -= item.price

	itemIsBuyable: (item) ->
		if item != undefined
			if  item.price <= @funds and item.x <= @selectBarPos + @selectBarWidth and item.x + item.sprite.width >= @selectBarPos
				return true
		return false

	selectBar: ->
		selectBarInactiveAlpha = 0.3
		selectBarActiveAlpha = 0.5
		selectBarAlpha = selectBarInactiveAlpha
		
		if @itemIsBuyable(@item)
			selectBarAlpha = selectBarActiveAlpha
		else
			selectBarAlpha = selectBarInactiveAlpha

		@game.util.drawRect(@selectBarPos, 0, @selectBarWidth, @game.height, "#fff", selectBarAlpha)
	
