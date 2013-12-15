class window.MenuScene
	constructor: (@game) ->
		@buttonPlay = new Button(@game.width / 2, @game.height / 2, 80, 50, "Play", @actionPlay, @game)
	update: ->
		@buttonPlay.update()

	render: ->
		@buttonPlay.render()

	actionPlay: ->
		@game.activeScene = @game.gameScene
	
