local STI = require "libs.STI"
local bump = require "bump"
local room = require "..res.maps.coop_level"
local player = require("player") --adds player class
local question = require("question") --adds question class
local comment = require("comment") --adds comment class
local NPC = require("NPC") --adds NPC class
local dialogue = require("dialogue")

require "collision"

local NPCspeed = 80
local NPCoffsetx = 5
local NPCoffsety = 2
local NPCw = 20
local NPCh = 30

local world = bump.newWorld()
local worldWidth = love.graphics.getWidth()
local worldHeight = love.graphics.getHeight()

local playerX = 100
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

--defines Emily as an NPC from data from the map. Will update when spritesheet comes
function defineObjects(map)
	for k, object in pairs(map.objects) do
		if object.name == "Basket" then
			basketdialogue = dialogue.basket
			basket = NPC:new(
        object.x,
        object.y,
        NPCspeed,
        object.properties.offsetx,
        object.properties.offsety,
        object.properties.width,
        object.properties.height,
        basketdialogue
      )
      basket.dialogue.canStart = true

      basketEnddialogue = dialogue.basketEnd
      basketEnd = NPC:new(
        object.x,
        object.y,
        NPCspeed,
        object.properties.offsetx,
        object.properties.offsety,
        object.properties.width,
        object.properties.height,
        basketEnddialogue
      )
		end

    if object.name == "Drawer" then
			drawerdialogue = dialogue.drawer
			drawer = NPC:new(
        object.x,
        object.y,
        NPCspeed,
        object.properties.offsetx,
        object.properties.offsety,
        object.properties.width,
        object.properties.height,
        drawerdialogue
      )
		end

    if object.name == "Bin" then
			bindialogue = dialogue.bin
			bin = NPC:new(
        object.x,
        object.y,
        NPCspeed,
        object.properties.offsetx,
        object.properties.offsety,
        object.properties.width,
        object.properties.height,
        bindialogue
      )
		end

--[[
    if object.name == "Basket" then
      basketdialogue = dialogue.basket
      basket = NPC:new(object.x,object.y,NPCspeed,NPCoffsetx,NPCoffsety,NPCw,NPCh,basketdialogue)
    end
]]
--[[
    if object.name == "Bin" then
      catherinedialogue = dialogue.catherine
      catherine = NPC:new(object.x,object.y,NPCspeed,NPCoffsetx,NPCoffsety,NPCw,NPCh,catherinedialogue)
    end

    if object.name == "Christopher" then
			christopherdialogue = dialogue.christopher
			christopher = NPC:new(object.x,object.y,NPCspeed,NPCoffsetx,NPCoffsety,NPCw,NPCh,christopherdialogue)
		end

    if object.name == "Mark" then
      markdialogue = dialogue.mark
      mark = NPC:new(object.x,object.y,NPCspeed,NPCoffsetx,NPCoffsety,NPCw,NPCh,markdialogue)
    end
]]
	end
end

function love.load()
	-- load map file
	map = STI.new("res/maps/coop_level.lua", {"box2d"})

  collisions(world,room,map,tilelength)
  local booboo = love.graphics.newImage("res/sprites/booboosheet.png")
  booboo:setFilter( 'nearest', 'nearest' )    --Scales image so that pixels are sharp
  player = player:new(booboo,playerspeed,playerX,playerY,18,28,8,4)		--instatiates booboo sprite

  world:add(
    player,
    player.x + player.xoff,
    player.y + player.yoff,
    player.w,
    player.h) --adds player as collidable object in world

  defineObjects(map)
end

function love.update(dt)
	-- Update world
	map:update(dt)
  player:updateinstance(dt)

  basket.dialogue:textUpdate(dt)
  drawer.dialogue:textUpdate(dt)
  bin.dialogue:textUpdate(dt)
  basketEnd.dialogue:textUpdate(dt)

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

  checkForGameUpdates()

  if(love.keyboard.isDown('escape')) then
      love.event.quit()
  end

end

function checkForGameUpdates()
  if basket.dialogue.done then
    drawer.dialogue.canStart = true
  end
  if drawer.dialogue.done then
    bin.dialogue.canStart = true
  end
  if bin.dialogue.done then
    basketEnd.dialogue.canStart = true
  end
end

function love.keyreleased(key)
  basket:speak(player,key)
  drawer:speak(player,key)
  bin:speak(player,key)
  basketEnd:speak(player,key)

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
  basket.dialogue:textDraw(player)
  drawer.dialogue:textDraw(player)
  bin.dialogue:textDraw(player)
  basketEnd.dialogue:textDraw(player)

  map:drawLayer(map.layers["Foreground"])
  map:drawLayer(map.layers["Foreground 2"])

end

function love.quit()
    print('Quitting Family Game...')
end
