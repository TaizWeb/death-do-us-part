love.graphics.setDefaultFilter("nearest", "nearest")
require("lib/heartbeat")
require("player")
require("tiles")
require("animation")
require("actors")
require("key")
require("button")

function love.load()
	windowWidth = love.graphics.getWidth()
	windowHeight = love.graphics.getHeight()
	love.window.setTitle("Death do us Part")
	love.keyboard.setKeyRepeat(true)
	love.filesystem.setIdentity("deathgame")
	Heartbeat.createPlayer(Player, -100, -100)
	Heartbeat.tilesList = {Ground, WallUp, WallLeft, WallRight, WallDown, CornerSE, CornerSW, CornerNW, CornerNE, Bridge, Jail, Lever, Lock, Bluewall, Redwall}
	Heartbeat.entitiesList = {Button, DoubleButton}
	Heartbeat.itemsList = {Key}
end

Editor = {}
Editor.isActive = false
redActive = true

function love.keypressed(key, scancode, isrepeat)
	if (key == "e" and not Heartbeat.editor.commandMode) then
		Heartbeat.editor.isActive = not Heartbeat.editor.isActive
	end
	if (Heartbeat.editor.isActive) then
		Heartbeat.editor.handleInput(key)
	end
	if (key == "q") then
		Animation.newAnimation(Player.suicide, 30)
	end
	if (key == "z") then
		Player.swap()
	end
	if (key == "x") then
		Player.activate()
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	if (Heartbeat.editor.isActive) then
		Heartbeat.editor.handleInput(button)
	end
end

function love.update(dt)
	Heartbeat.player.dx = 0
	Heartbeat.player.dy = 0
	if (love.keyboard.isDown("left")) then
		Heartbeat.player.dx = -5
		Heartbeat.player.direction = "left"
	elseif (love.keyboard.isDown("right")) then
		Heartbeat.player.dx = 5
		Heartbeat.player.direction = "right"
	elseif (love.keyboard.isDown("up")) then
		Heartbeat.player.dy = -5
		Heartbeat.player.direction = "up"
	elseif (love.keyboard.isDown("down")) then
		Heartbeat.player.dy = 5
		Heartbeat.player.direction = "down"
	end

	-- Hold-down functionality for the editor
	if (Heartbeat.editor.isActive) then
		if (love.mouse.isDown(1) and Heartbeat.editor.mode == "tile") then
			Heartbeat.editor.handleInput(1)
		end
		if (love.mouse.isDown(2)) then
			Heartbeat.editor.handleInput(2)
		end
	end
end

function love.draw()
	Heartbeat.beat()
	Animation.doAnimations()
end

