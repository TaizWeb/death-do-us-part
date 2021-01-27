Key = {
	id = "key",
	texture = love.graphics.newImage("assets/key.png"),
	width = 16,
	height = 16,
	scaleX = 3,
	scaleY = 3
}

function Key.onPickup(this)
	print("Got key")
	Player.hasKey = true
	Heartbeat.removeItem(this)
end

