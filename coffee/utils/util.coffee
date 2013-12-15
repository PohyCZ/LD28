class window.Util
	constructor: (@game) ->

	drawSprite: (img, x, y) ->
		@game.context.drawImage(img, x, y)

	drawRect: (x, y, width, height, color) ->
		@game.context.globalAlpha = 1
		@game.context.fillStyle = color
		@game.context.fillRect(x, y, width, height)
	
	randomRange: (min, max) ->
		return Math.floor(Math.random() * (max - min + 1)) + min

	random: (max) ->
		return Math.floor(Math.random() * (max + 1))
