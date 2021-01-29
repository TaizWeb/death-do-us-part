Ground = {
	id = "ground",
	texture = love.graphics.newImage("assets/ground.png"),
	width = 25,
	height = 25,
	scaleX = 25/16,
	scaleY = 25/16,
	isSolid = false
}

Bridge = {
	id = "bridge",
	texture = love.graphics.newImage("assets/bridge.png"),
	width = 25,
	height = 25,
	scaleX = 25/16,
	scaleY = 25/16,
	isSolid = false
}

Jail = {
	id = "jail",
	texture = love.graphics.newImage("assets/jail.png"),
	width = 25,
	height = 25,
	scaleX = 25/16,
	scaleY = 25/16,
	isSolid = true
}

-- ok forgive me for this, but heartbeat didn't have tile rotation and I didn't want to change the entire engine's level formats for a jam so I committed this sin
WallRight = {
	id = "wallRight",
	texture = love.graphics.newImage("assets/brick.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = 50/32,
	isSolid = true
}

WallLeft= {
	id = "wallLeft",
	texture = love.graphics.newImage("assets/brick.png"),
	width = 50,
	height = 50,
	scaleX = -50/32,
	scaleY = 50/32,
	isSolid = true
}

WallUp = {
	id = "wallUp",
	texture = love.graphics.newImage("assets/brick.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = -50/32,
	isSolid = true,
	rotation = math.pi/2
}

WallDown = {
	id = "wallDown",
	texture = love.graphics.newImage("assets/brick.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = 50/32,
	isSolid = true,
	rotation = math.pi/2
}

CornerSE = {
	id = "cornerSE",
	texture = love.graphics.newImage("assets/corner.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = 50/32,
	isSolid = true
}

CornerSW = {
	id = "cornerSW",
	texture = love.graphics.newImage("assets/corner.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = 50/32,
	isSolid = true,
	rotation = math.pi/2
}

CornerNW = {
	id = "cornerNW",
	texture = love.graphics.newImage("assets/corner.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = 50/32,
	isSolid = true,
	rotation = math.pi
}

CornerNE = {
	id = "cornerNE",
	texture = love.graphics.newImage("assets/corner.png"),
	width = 50,
	height = 50,
	scaleX = 50/32,
	scaleY = 50/32,
	isSolid = true,
	rotation = -math.pi/2
}

