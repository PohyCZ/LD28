class window.Keys
	constructor: ->
		@debug = true

		@keys = []

		$(document.body).on("keydown", (e) =>
			k = e.charCode || e.keyCode
			if @keyNotPressed(k)
				@keys.push(k)
			if @debug
				console.log(@keys)
		)
		$(document.body).on("keyup", (e) =>
			k = e.charCode || e.keyCode
			if @keyPressed(k)
				@keys.splice(@keys.indexOf(k), 1)
			if @debug
				console.log(@keys)
		)

	keyNotPressed: (k) ->
		@keys.indexOf(k) == -1

	keyPressed: (k) ->
		@keys.indexOf(k) != -1

class window.Mouse
	constructor: (canvasId) ->
		@debug = false

		@canvas = document.getElementById(canvasId)

		@x = 0
		@y = 0
		@button = false

		$(document.body).on("mousemove", (e) =>
			rect = @canvas.getBoundingClientRect()
			@x = Math.floor(e.clientX - rect.left)
			@y = Math.floor(e.clientY - rect.top)
			if @debug
				console.log(@coords)
		)

		$(document.body).on("mousedown", =>
			@button = true
			if @debug
				console.log(@button)
		)

		$(document.body).on("mouseup", =>
			@button = false
			if @debug
				console.log(@button)
		)
