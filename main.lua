function love.load()
	love.window.setMode(1600,1200)

	target = {}
	target.x = love.math.random(0, 1600)
	target.y = 0
	target.radius = 40

	timer = 0
	score = 0
	distance = 0

	font = love.graphics.newFont(30)
	
end

function love.update(dt)
	timer = timer+1

	if timer%60 == 0 then
		target.y = love.math.random(0, 1200)
		target.x = love.math.random(0, 1600)
	end

end

function love.draw()
	--love.graphics.setColor(100/255,0,0)

	local scoreText = "Score: " .. score

	love.graphics.setFont(font)
	love.graphics.circle("fill", target.x, target.y, target.radius)
	love.graphics.print(scoreText,200,500)
	--love.graphics.print(distance,200,300)
	--love.graphics.print(timer,200,700)
end

function love.mousepressed(x, y, button, istouch, presses)
	
	distance = getDistance(x,y, target.x, target.y)

	if distance <= target.radius then 
		score = score + 1
	else 
		score = score - 1
	end

end

function getDistance (x1, y1, x2, y2)
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end