function love.load()
	love.window.setMode(1600,1200)

	target = {}
	target.x = love.math.random(200, 1400)
	target.y = love.math.random(300, 1100)
	target.radius = 40

	timer = 0
	score = 0

	scoredx = {
		value = 0,
		x = 0,
		y = 0,
		timer = 180
	}
	-- scoredx.value = 0
	-- scoredx.x = 0
	-- scoredx.y = 0
	-- scoredx.timer = 180

	distance = 0

	font = love.graphics.newFont(30)
	
end

function love.update(dt)
	timer = timer+1

	if timer%60 == 0 then
		target.x = love.math.random(200, 1400)
		target.y = love.math.random(300, 1100)
	end

	if scoredx.timer < 180 then
		scoredx.timer = scoredx.timer + 1
	end

	scoredx.y = scoredx.y - 1
	
end

function love.draw()
	love.graphics.setColor(1,1,1)

	local scoreText = "Score: " .. score

	love.graphics.setFont(font)
	love.graphics.circle("fill", target.x, target.y, target.radius)
	love.graphics.rectangle("line",150,250,1300,900)
	love.graphics.print(scoreText,200,200)
	if scoredx.timer < 60 then
		if scoredx.value == 1 then
			love.graphics.setColor(0,1,0)
			love.graphics.print("+1",scoredx.x,scoredx.y)
			
		elseif scoredx.value == -1 then
			love.graphics.setColor(1,0,0)
			love.graphics.print("-1",scoredx.x,scoredx.y)
		end
	end
end

function love.mousepressed(x, y, button, istouch, presses)
	
	distance = getDistance(x,y, target.x, target.y)
	scoredx.x = x
	scoredx.y = y

	if distance <= target.radius then 
		score = score + 1
		scoredx.value = 1
		scoredx.timer = 0
	else 
		score = score - 1
		scoredx.value = -1
		scoredx.timer = 0
	end

end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end

function getDistance (x1, y1, x2, y2)
	return math.sqrt((x2-x1)^2 + (y2-y1)^2)
end


-- function scoredx:AddScoredx(value, x, y, timer)
-- 	scoredx[#scoredx+1] = {
-- 		value = value,
-- 		x = x,
-- 		y = y,
-- 		timer = timer
-- 	}
-- 	return #scoredx
-- end
