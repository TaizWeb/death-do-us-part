DoubleButton = {
	id = "doublebutton",
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

function DoubleButton.checkValidity()
	for i=1,#Heartbeat.entities do
		if (Heartbeat.entities[i].id == "button" and not Heartbeat.entities[i].isActive) then
			return false
		end
	end
	return true
end

function DoubleButton.behaivor(this)
	if (Heartbeat.checkEntityCollision(Heartbeat.player, this) or Heartbeat.checkEntityCollision(Partner, this)) then
		this.isActive = true
		this.texture = DoubleButton.textures[2]
		DoubleButton.checkValidity()
	else
		this.isActive = false
		this.texture = DoubleButton.textures[1]
	end
end

function DoubleButton.draw(this)
	-- Initializing
	if (this.isActive == nil) then
		this.isActive = false
	end

	love.graphics.draw(this.texture, Camera.convert("x", this.x), Camera.convert("y", this.y), this.rotation, DoubleButton.scaleX, DoubleButton.scaleY, this.offsetX, this.offsetY)
end
