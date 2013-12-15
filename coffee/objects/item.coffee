class window.Item
	constructor: (@x, @y, @game) ->
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
		@phase = 0

		if @game.debug
			console.log("generated item #{@name} at: x: #{@x}, y: #{@y}")

	update: ->
		switch @phase
			when 0
				@x -= @speed
				# @x = @game.width / 2 - 32

	render: ->
		@game.util.drawSprite(@sprite, @x, @y)
		@game.util.drawText(@name.capitalize(), @x + @sprite.width / 2, @y - 4, "#fff", true)