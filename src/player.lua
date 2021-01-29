Guy = {
	x = -200,
	y = -200,
	texture = love.graphics.newImage("assets/guy-front.png"),
	textures = {
		front = love.graphics.newImage("assets/guy-front.png"),
		back = love.graphics.newImage("assets/guy-back.png"),
		side = love.graphics.newImage("assets/guy-side.png")
	},
	walkFront = {
		love.graphics.newImage("assets/guy-front-walk1.png"),
		love.graphics.newImage("assets/guy-front-walk2.png"),
		love.graphics.newImage("assets/guy-front-walk3.png"),
		love.graphics.newImage("assets/guy-front-walk4.png"),
	},
	walkBack = {
		love.graphics.newImage("assets/guy-back-walk1.png"),
		love.graphics.newImage("assets/guy-back-walk2.png"),
		love.graphics.newImage("assets/guy-back-walk3.png"),
		love.graphics.newImage("assets/guy-back-walk4.png"),
	},
	walkSide = {
		love.graphics.newImage("assets/guy-side-walk1.png"),
		love.graphics.newImage("assets/guy-side-walk2.png"),
		love.graphics.newImage("assets/guy-side-walk3.png"),
		love.graphics.newImage("assets/guy-side-walk4.png"),
	},
	suicideAnim = {
		love.graphics.newImage("assets/guy-suicide1.png"),
		love.graphics.newImage("assets/guy-suicide2.png"),
		love.graphics.newImage("assets/guy-suicide3.png"),
		love.graphics.newImage("assets/guy-suicide4.png"),
		love.graphics.newImage("assets/guy-suicide5.png"),
	},
	scaleX = 3,
	scaleY = 3,
	offsetX = 0,
	offsetY = 0,
	height = 40,
	width = 40,
	walkFrame = 0
}

Gal = {
	texture = love.graphics.newImage("assets/gal-front.png"),
	textures = {
		front = love.graphics.newImage("assets/gal-front.png"),
		back = love.graphics.newImage("assets/gal-back.png"),
		side = love.graphics.newImage("assets/gal-side.png")
	},
	walkFront = {
		love.graphics.newImage("assets/gal-front-walk1.png"),
		love.graphics.newImage("assets/gal-front-walk2.png"),
		love.graphics.newImage("assets/gal-front-walk3.png"),
		love.graphics.newImage("assets/gal-front-walk4.png"),
	},
	walkBack = {
		love.graphics.newImage("assets/gal-back-walk1.png"),
		love.graphics.newImage("assets/gal-back-walk2.png"),
		love.graphics.newImage("assets/gal-back-walk3.png"),
		love.graphics.newImage("assets/gal-back-walk4.png"),
	},
	walkSide = {
		love.graphics.newImage("assets/gal-side-walk1.png"),
		love.graphics.newImage("assets/gal-side-walk2.png"),
		love.graphics.newImage("assets/gal-side-walk3.png"),
		love.graphics.newImage("assets/gal-side-walk4.png"),
	},
	suicideAnim = {
		love.graphics.newImage("assets/gal-suicide1.png"),
		love.graphics.newImage("assets/gal-suicide2.png"),
		love.graphics.newImage("assets/gal-suicide3.png"),
		love.graphics.newImage("assets/gal-suicide4.png"),
		love.graphics.newImage("assets/gal-suicide5.png"),
	},
	scaleX = 3,
	scaleY = 3,
	offsetX = 0,
	offsetY = 0,
	height = 40,
	width = 40,
	walkFrame = 0
}

function initPlayer()
function Player.draw(this)
	if (not Player.isSuiciding) then
		Player.setFrame()
	end

	love.graphics.setColor(1, 1, 1, 1)
	-- Draw the hitbox
	--love.graphics.rectangle("fill", Camera.convert("x", this.x), Camera.convert("y", this.y), this.width, this.height)
	-- Draw the player
	love.graphics.draw(this.texture, Camera.convert("x", this.x), Camera.convert("y", this.y), this.rotation, Player.scaleX, Player.scaleY, this.offsetX, this.offsetY)
	-- Draw the partner
	love.graphics.draw(Partner.texture, Camera.convert("x", Partner.x), Camera.convert("y", Partner.y), this.rotation, Partner.scaleX, Partner.scaleY, Partner.offsetX, Partner.offsetY)

	-- Draw items
	Player.drawItems(this)
end

function Player.drawItems(this)
	if (Player.hasKey) then
		love.graphics.draw(Key.texture, Camera.convert("x", this.x), Camera.convert("y", this.y), 0, 1, 1, 0, 0)
	end
	
	if (Partner.hasKey) then
		love.graphics.draw(Key.texture, Camera.convert("x", Partner.x), Camera.convert("y", Partner.y), 0, 1, 1, 0, 0)
	end
end

function Player.setFrame()
	-- If the player is moving, use a walking animation
	if (Heartbeat.player.dx ~= 0 or Heartbeat.player.dy ~= 0) then

		-- Resetting walkFrame if it's 0, then decrementing
		if (Player.walkFrame <= 0) then
			Player.walkFrame = 60
		end
		Player.walkFrame = Player.walkFrame - 1

		-- Set the proper frame to use
		local frameIndex = math.floor(Player.walkFrame / 15) + 1
		if (Heartbeat.player.direction == "left") then
			Heartbeat.player.texture = Player.walkSide[frameIndex]
			Player.scaleX = -3
			Heartbeat.player.offsetX = 16
		elseif (Heartbeat.player.direction == "right") then
			Heartbeat.player.texture = Player.walkSide[frameIndex]
			Player.scaleX = 3
			Heartbeat.player.offsetX = 3
		elseif (Heartbeat.player.direction == "up") then
			Heartbeat.player.texture = Player.walkBack[frameIndex]
		else
			Heartbeat.player.texture = Player.walkFront[frameIndex]
		end
	else
		-- If the player isn't moving, use a idle frame
		if (Heartbeat.player.direction == "left") then
			Heartbeat.player.texture = Player.textures.side
			Player.scaleX = -3
			Heartbeat.player.offsetX = 16
		elseif (Heartbeat.player.direction == "right") then
			Heartbeat.player.texture = Player.textures.side
			Player.scaleX = 3
			Heartbeat.player.offsetX = 3
		elseif (Heartbeat.player.direction == "up") then
			Heartbeat.player.texture = Player.textures.back
		else
			Heartbeat.player.texture = Player.textures.front
		end
	end
end

function Player.suicide(frame, data)
	Player.isSuiciding = true
	Heartbeat.player.texture = Player.suicideAnim[math.floor(frame/6)+1]
	if (frame == 29) then
		Player.isSuiciding = false
		Heartbeat.player.x = Partner.x
		Heartbeat.player.y = Partner.y
	end
end

function Player.swap()
	Player.x = Heartbeat.player.x
	Player.y = Heartbeat.player.y
	Heartbeat.player.x = Partner.x
	Heartbeat.player.y = Partner.y
	tmp = Player
	Player = Partner
	initPlayer()
	Partner = tmp
end

function Player.activate()
	for i=1,#Heartbeat.tiles do
		if (Heartbeat.tiles[i].id == "lever" and Player.compareDistance(Heartbeat.tiles[i])) then
			-- Replace all reds with blues and vice versa
			for i=1,#Heartbeat.tiles do
				if (Heartbeat.tiles[i].id == "wallRed") then
					Heartbeat.tiles[i].id = "wallBlue"
					Heartbeat.tiles[i].isSolid = false
					Heartbeat.tiles[i].texture = Bluewall.texture
				elseif (Heartbeat.tiles[i].id == "wallBlue") then
					Heartbeat.tiles[i].id = "wallRed"
					Heartbeat.tiles[i].isSolid = true
					Heartbeat.tiles[i].texture = Redwall.texture
				end
			end
		end
		if (Heartbeat.tiles[i].id == "lock" and Player.hasKey and Player.compareDistance(Heartbeat.tiles[i])) then
			Heartbeat.removeTile(Heartbeat.tiles[i])
			Player.hasKey = false
		end
	end
end

function Player.compareDistance(object)
	return ((math.abs(object.x - Heartbeat.player.x) < 50) and math.abs(object.y - Heartbeat.player.y) < 50)
end
end

Player = Gal
initPlayer()
Partner = Guy
