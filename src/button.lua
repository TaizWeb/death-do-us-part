Button = {
	id = "button",
	texture = love.graphics.newImage("assets/button-redo1.png"),
	textures = {
		love.graphics.newImage("assets/button-redo1.png"),
		love.graphics.newImage("assets/button-redo2.png")
	},
	width = 16,
	height = 16,
	scaleX = 3,
	scaleY = 3
}

function Button.behaivor(this)
	if (Heartbeat.checkEntityCollision(Heartbeat.player, this) or Heartbeat.checkEntityCollision(Partner, this)) then
		this.isActive = true
		this.texture = Button.textures[2]
		makeBridge(this.dimensions[1], this.dimensions[2], this.dimensions[3])
	else
		this.isActive = false
		destroyBridge(this.dimensions[1], this.dimensions[2], this.dimensions[3])
		this.texture = Button.textures[1]
	end
end

function roomAction(button)
	if (Heartbeat.levelName == "prison") then
		print("IN PRISON")
	elseif (Heartbeat.levelName == "level2") then
		if (button.x == 1029) then
			return {1000, 1050, 1250}
			--makeBridge(1000, 1050, 1250)
		elseif (button.x == 746) then
			return {850, 1050, 1250}
		elseif (button.x == 776) then
			return {750, 625, 800}
		end
	end
end

function makeBridge(startX, startY, stopY)
	while (startY <= stopY) do
		Heartbeat.newTile(Bridge, startX, startY)
		Heartbeat.newTile(Bridge, startX+25, startY)
		Heartbeat.newTile(Bridge, startX+50, startY)
		startY = startY + 25
	end
end

function destroyBridge(startX, startY, stopY)
	while (startY <= stopY) do
		Heartbeat.removeTile("", startX, startY)
		Heartbeat.removeTile("", startX+25, startY)
		Heartbeat.removeTile("", startX+50, startY)
		startY = startY + 25
	end
end

function Button.draw(this)
	-- Initializing
	if (this.isActive == nil) then
		this.isActive = false
		this.dimensions = roomAction(this)
	end
	

	love.graphics.draw(this.texture, Camera.convert("x", this.x), Camera.convert("y", this.y), this.rotation, Button.scaleX, Button.scaleY, this.offsetX, this.offsetY)
end

