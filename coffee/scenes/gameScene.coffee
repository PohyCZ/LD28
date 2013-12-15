class window.GameScene
	constructor: (@game) ->
		@items = @generateItems(2)
		@phase = 0

	update: ->
		for item in @items
			item.update()

	render: ->
		@game.context.clearRect(0, 0, @game.width, @game.height)
		@game.util.drawRect(0, 0, @game.width, @game.height, "#000")
		for item in @items
			item.render()

	generateItems: (count) ->
		items = []

		for i in [0...count]
			items.push(new Item((parseInt(@game.width) + 64*i), 50, @game))

		return items
	
