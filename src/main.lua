local STI = require "libs.STI"
local bump = require "bump"
local room = require "..res.maps.coop_level"
local player = require("player") --adds player class

require "collision"

local world = bump.newWorld()
local worldWidth = love.graphics.getWidth()
local worldHeight = love.graphics.getHeight()

local playerX = 80
local playerY = 80
local playerspeed = 80

local scale = 2
local tilelength = 32

--returns true if a collision between box1 and 2 occurs
function checkcollision(box1, box2)
  return box1.x < box2.x + box2.w and
         box2.x < box1.x + box1.w and
         box1.y < box2.y + box2.h and
         box2.y < box1.y + box1.h
end

function love.load()
	-- load map file
	map = STI.new("res/maps/coop_level.lua", {"box2d"})

  collisions(world,room,map,tilelength)
  print("collisions done")
  local booboo = love.graphics.newImage("res/sprites/booboosheet.png")
  booboo:setFilter( 'nearest', 'nearest' )    --Scales image so that pixels are sharp
  player = player:new(booboo,playerspeed,playerX,playerY,18,28,8,4)		--instatiates booboo sprite

  world:add(
    player,
    player.x + player.xoff,
    player.y + player.yoff,
    player.w,
    player.h) --adds player as collidable object in world

end

function love.update(dt)
	-- Update world
	map:update(dt)
  player:updateinstance(dt)

  --update character position based on where player moves
	--redefines player's collision box for dialogue depending on which way he faces
	local dx,dy = 0,0
	if player.control then
	  if (love.keyboard.isDown(player.down)) then
		    dy = player:walkdown(dy,dt)
	  end
	  if (love.keyboard.isDown(player.right)) then
		    dx = player:walkright(dx,dt)
    end
	  if (love.keyboard.isDown(player.left)) then
		    dx = player:walkleft(dx,dt)
    end
    if (love.keyboard.isDown(player.up)) then
		    dy = player:walkup(dy,dt)
    end
	end
	move(world,player,dx,dy)

  if(love.keyboard.isDown('escape')) then
      love.event.quit()
  end

end

function love.keyreleased(key)
--puts character in idle state if player releases walking keys.
	if player.control then
	  if key == player.down then
		    player:standdown()
	  end
	  if key == player.right then
		    player:standright()
	  end
	  if key == player.left then
		    player:standleft()
	  end
	  if key == player.up then
	     player:standup()
	  end
	end
end

function love.draw()
  love.graphics.scale(scale)
--	love.graphics.translate( (worldWidth/4 - player.x), (worldHeight/4 - player.y) )
  -- Draw world
  map:draw()
  map:setDrawRange(5, 5, 256, 256)
  -- Draw player
  player:drawinstance()
  map:drawLayer(map.layers["Foreground"])
end

function love.quit()
    print('Quitting Family Game...')
end
