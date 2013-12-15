class window.Button
	constructor: (@x, @y, @width, @height, @text, @action, @game) ->
		@color = "#fff"	
		@fontColor = "#fff"
		@font = "24pt Arial"
		if @game.debug
			console.log("created button #{@text} at x: #{@x}, y: #{@y}")

	update: ->
		if @isActive()
			@color = "#f00"
			@fontColor = "#f00"
			if @game.mouse.button
				@action()
		else
			@color = "#fff"
			@fontColor = "#fff"

	render: ->
		@game.context.clearRect(0, 0, @game.width, @game.height)
		@game.util.drawRect(0, 0, @game.width, @game.height, "#000")

		@game.util.drawRect(@x - @width / 2, @y - @height / 2, @width, @height, @color, 1, true)
		@game.util.drawText(@text, @x, @y + @height / 5, @fontColor, true, @font)

	isActive: ->
		@game.mouse.x >= @x - @width / 2 and @game.mouse.x <= @x + @width / 2 and @game.mouse.y >= @y - @height / 2 and @game.mouse.y <= @y + @height / 2

	
