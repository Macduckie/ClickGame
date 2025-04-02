function love.load()
	love.window.setMode(1600,1200)

	target = {}
	target.x = love.math.random(200, 1400)
	target.y = love.math.random(500, 1200)
	target.radius = 40

	timer = 0
	score = 0
	scoredx = 0
	scoredx_x = 0
	scoredx_y = 0
	scoredx_timer = 60

	distance = 0

	font = love.graphics.newFont(30)
	
end

function love.update(dt)
	timer = timer+1

	if timer%60 == 0 then
		target.x = love.math.random(200, 1400)
		target.y = love.math.random(500, 1200)
	end

	if scoredx_timer < 180 then
		scoredx_timer = scoredx_timer + 1
	end

	scoredx_y = scoredx_y - 1
	
end

function love.draw()
	love.graphics.setColor(1,1,1)

	local scoreText = "Score: " .. score

	love.graphics.setFont(font)
	love.graphics.circle("fill", target.x, target.y, target.radius)
	love.graphics.print(scoreText,200,200)
	if scoredx_timer < 60 then
		if scoredx == 1 then
			love.graphics.setColor(0,1,0)
			love.graphics.print("+1",scoredx_x,scoredx_y)
			
		elseif scoredx == -1 then
			love.graphics.setColor(1,0,0)
			love.graphics.print("-1",scoredx_x,scoredx_y)
		end
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	
	distance = getDistance(x,y, target.x, target.y)
	scoredx_x = x
	scoredx_y = y

	if distance <= target.radius then 
		score = score + 1
		scoredx = 1
		scoredx_timer = 0
	else 
		score = score - 1
		scoredx = -1
		scoredx_timer = 0
	end

end

function getDistance (x1, y1, x2, y2)
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end