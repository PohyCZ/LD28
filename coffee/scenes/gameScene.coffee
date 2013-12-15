class window.GameScene
	constructor: (@game) ->
		@phase = 0
		@items = @spawnItems(5)
		if @game.debug
				console.log("-------------------------")
		@basket = new Basket(@game, @)

	update: ->
		if @game.debug and @game.keys.keyPressed(82)
			console.log("spawning items")
			@items = @spawnItems(5)
		for item in @items
			if item != undefined
				item.update()
		@basket.update()

	render: ->
		@game.context.clearRect(0, 0, @game.width, @game.height)
		@game.util.drawRect(0, 0, @game.width, @game.height, "#0f0f0f")

		for item in @items
			if item != undefined
				item.render()
		@basket.render()

	spawnItems: (count) ->
		items = []

		for i in [0...count]
			items.push(new Item((parseInt(@game.width) + (64*i)), 200, @game, @))

		return items
	
