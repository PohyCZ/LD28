class window.GameScene
	constructor: (@game) ->
		@phase = 0
		@items = @generateItems(2)
		if @game.debug
				console.log("-------------------------")
		@basket = new Basket(@game, @)

	update: ->
		for item in @items
			item.update()
		@basket.update()

	render: ->
		@game.context.clearRect(0, 0, @game.width, @game.height)
		@game.util.drawRect(0, 0, @game.width, @game.height, "#0f0f0f")
		
		for item in @items
			item.render()
		@basket.render()

	generateItems: (count) ->
		items = []

		for i in [0...count]
			items.push(new Item((parseInt(@game.width) + 64*i), 200, @game, @))

		return items
	
