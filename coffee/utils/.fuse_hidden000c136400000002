class window.Util
	constructor: (@game) ->

	drawSprite: (img, x, y) ->
		@game.context.drawImage(img, x, y)

	drawRect: (x, y, width, height, color, alpha = 1) ->
		@game.context.globalAlpha = alpha
		@game.context.fillStyle = color
		@game.context.fillRect(x, y, width, height)

	###*
	* Renders text
	* @param {number} text
	* @param {text} color
	* @param {number} x position
	* @param {number} y position
	* @param {boolean} center = false
	* @param {text} font = "8pt Arial"
	* @param {number} alpha = 1
	###
	drawText: (text, x, y, color = "#fff", center = false, font = "8pt Arial", alpha = 1) ->
		@game.context.font = font
		@game.context.fillStyle = color
		@game.context.globalAlpha = alpha
		if center
			metrics = @game.context.measureText(text)
			@game.context.fillText(text, x - metrics.width / 2, y)
		else
			@game.context.fillText(text, x, y)
	
	randomRange: (min, max) ->
		return Math.floor(Math.random() * (max - min + 1)) + min

	random: (max) ->
		return Math.floor(Math.random() * (max + 1))

	String.prototype.capitalize = `function() {
			return this.charAt(0).toUpperCase() + this.slice(1);
		}`
