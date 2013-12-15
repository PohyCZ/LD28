window.onload = ->
	class window.Game
		constructor: (canvasId) ->
			@debug = true

			@includeScripts()
			if @debug
				console.log("-------------------------")

			@context = document.getElementById(canvasId).getContext("2d")
			@width = $(canvasId).attr("width")
			@height = $(canvasId).attr("height")
			@fps = 60

			if @debug
				@stats = @initStats()

			@util = new Util(@)
			@keys = new Keys()
			@mouse = new Mouse(canvasId)

			@gameScene = new GameScene(@)
			@activeScene = @gameScene

			setInterval(=>
				if @debug
					@stats.begin()
				@activeScene.update()
				@activeScene.render()
				if @debug
					@stats.end()

			1000 / @fps)

		includeScripts: ->
			urls = [
				"objects/item.js",
				"objects/basket.js",
				"scenes/gameScene.js",
				"utils/util.js",
				"utils/input.js"
			]

			for url in urls
				script = document.createElement("script")
				script.type = "text/javascript"
				script.src = "assets/src/" + url
				$("head").append(script)
				if @debug
					console.log("loaded " + url)

		initStats: ->
			stats = new Stats()
			stats.setMode(0)
			stats.domElement.style.position = "absolute"
			stats.domElement.style.left = "0px"
			stats.domElement.style.top = "0px"
			document.body.appendChild(stats.domElement)
			return stats

	game = new Game("canvas")
	
