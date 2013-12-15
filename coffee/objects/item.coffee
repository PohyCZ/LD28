class window.Item
	constructor: (@x, @y, @game, @gameScene) ->
		# , sprite, @name, @price, @type,
		items = {
			0: {
				name: "phone",
				price: 10000,
				type: "tech",
			},
			1: {
				name: "fridge",
				price: 5000,
				type: "home"
			}
		}

		item = items[@game.util.random(1)]
		@sprite = new Image()
		@sprite.src = "assets/img/items/#{item.name}.png"
		@name = item.name
		@price = item.price
		@type = item.type
		@speed = 2.5
		@phase = @gameScene.phase

		if @game.debug
			console.log("spawned item #{@name} at: x: #{@x}, y: #{@y}")

	update: ->
		switch @phase
			when 0
				if false # @game.debug
					@x = @game.mouse.x
				else
					@x -= @speed

				if @x + @sprite.width <= 0
					console.log("despawned item #{@name}")
					@gameScene.items.splice(@gameScene.items.indexOf(this), 1)

	render: ->
		@game.util.drawSprite(@sprite, @x, @y)
		@game.util.drawText(@name.capitalize(), @x + @sprite.width / 2, @y - 4, "#fff", true)
		@game.util.drawText(@price, @x + @sprite.width / 2, @y + @sprite.height + 12, "#fff", true)