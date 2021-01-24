love.graphics.setDefaultFilter("nearest", "nearest")
require("lib/heartbeat")
require("player")
require("tiles")

function love.load()
	windowWidth = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()
	love.window.setTitle("Death do us Part")
	love.keyboard.setKeyRepeat(true)
	love.filesystem.setIdentity("deathgame")
	Heartbeat.createPlayer(Player, -100, -100)
	Heartbeat.tilesList = {Ground}
end

Editor = {}
Editor.isActive = false

function love.keypressed(key, scancode, isrepeat)
	if (key == "e" and not Heartbeat.editor.commandMode) then
		Heartbeat.editor.isActive = not Heartbeat.editor.isActive
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	if (Heartbeat.editor.isActive) then
		Heartbeat.editor.handleInput(button)
	end
end

function love.update(dt)
	if (love.keyboard.isDown("left")) then
		Heartbeat.player.dx = -5
		Heartbeat.player.direction = "left"
	elseif (love.keyboard.isDown("right")) then
		Heartbeat.player.dx = 5
		Heartbeat.player.direction = "right"
	else
		Heartbeat.player.dx = 0
	end
end

function love.draw()
	Heartbeat.beat()
end

