ultima=""

function love.load()
	snake = {x=400, y=300, width=20, height=20}
	flow = "inicio"
end

function love.draw()
	if flow == "inicio" then
		love.graphics.print("Aperte qualquer seta para comecar", 340, 300)
	elseif flow == "perdeu" then
		love.graphics.print("Voce perdeu", 340, 300)
	end

	love.graphics.setColor(255,255,255)
	love.graphics.rectangle("fill", snake.x, snake.y, snake.width, snake.height)
end

function love.keypressed(key)
	if (flow ~= "perdeu") then
		if (key == "up") then
			if(ultima ~= "down") then
				flow = "cima"
			end
			ultima = "up"
		elseif (key == "right") then
			if(ultima ~= "left") then
				flow = "direita"
			end
			ultima = "right"
		elseif (key == "down") then
			if(ultima ~= "up") then
				flow = "baixo"
			end
			ultima = "down"
		elseif (key == "left") then
			if(ultima ~= "right") then
				flow = "esquerda"
			end
			ultima = "left"
		end
	elseif (flow == "perdeu") then
		if (key == "return") then
			flow = "inicio"
		end
	end
end


function love.update(dt)
	love.timer.sleep(100)
	if(flow == "cima") then
		snake.y = snake.y - 20
	elseif(flow == "direita") then
		snake.x = snake.x + 20
	elseif(flow == "baixo") then
		snake.y = snake.y + 20
	elseif(flow == "esquerda") then
		snake.x = snake.x - 20
	end

	if (snake.y <= 0) then
		flow = "perdeu"
	elseif (snake.x <= 0) then
		flow = "perdeu"
	elseif (snake.y + snake.height >= 600) then
		flow = "perdeu"
	elseif (snake.x + snake.width >= 800) then
		flow = "perdeu"
	end
end
