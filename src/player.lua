Player = {
	texture = love.graphics.newImage("assets/guy-front.png"),
	textures = {
		front = love.graphics.newImage("assets/guy-front.png"),
		back = love.graphics.newImage("assets/guy-back.png"),
		side = love.graphics.newImage("assets/guy-side.png")
	},
	scaleX = 2,
	scaleY = 2,
	height = 25,
	width = 25
}

function Player.draw(this)
	love.graphics.setColor(1, 1, 1, 1)
	if (Heartbeat.player.direction == "left") then
		Heartbeat.player.texture = Player.textures.side
		Player.scaleX = -2
	elseif (Heartbeat.player.direction == "right") then
		Heartbeat.player.texture = Player.textures.side
		Player.scaleX = 2
	elseif (Heartbeat.player.direction == "back") then
		Heartbeat.player.texture = Player.textures.back
	else
		Heartbeat.player.texture = Player.textures.front
	end

	love.graphics.draw(this.texture, Camera.convert("x", this.x), Camera.convert("y", this.y), this.rotation, Player.scaleX, Player.scaleY, this.offsetX, this.offsetY)
end

