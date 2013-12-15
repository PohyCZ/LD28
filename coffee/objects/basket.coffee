class window.Basket
	constructor: (@game) ->
		@items = []
		@funds = 0

	add: (item) ->
		@items.push(item)

	update: ->
		switch @game.gameScene.phase
			when 0
		

	render: ->
		switch @game.gameScene.phase
			when 0
				selectBarWidth = 70
				@game.util.drawRect(@game.width / 2 - selectBarWidth/2, 0, selectBarWidth, @game.height, "#fff", 0.5)
	
