local Block = require('entities/block')
local Background = require('entities/background')

math.randomseed(os.time())

function love.load()
  alpha = 0
  alphaIncrementer = 1
  alphaMultiplier = 3

  love.physics.setMeter(64) --the height of a meter our worlds will be 64px
  world = love.physics.newWorld(0, 0, true)
  love.window.setMode(650, 650)

  background = Background:new(0, 0, {
    size = 25,
    colors = {
      {
        red = 22,
        green = 66,
        blue = 194
      },
      {
        red = 128,
        green = 86,
        blue = 196
      },
      {
        red = 128,
        green = 43,
        blue = 170
      }
    },
    alpha = 1,
    fill = {
      color = {
        red = 28,
        green = 27,
        blue = 41
      },
      alpha = 1
    },
    maxHeight = 650,
    maxWidth = 650
  })
  background:build()

  block = Block:new(world, 200, 200)
end

function love.update(dt)
  world:update(dt)

  if alpha == 255 then
    alphaIncrementer = -1
  elseif alpha == 0 then
    alphaIncrementer = 1
  end

  alpha = alpha + alphaMultiplier * alphaIncrementer

  if love.keyboard.isDown("d") then
    block.body:applyForce(400, 0)
  end
  if love.keyboard.isDown("a") then
    block.body:applyForce(-400, 0)
  end
  if love.keyboard.isDown("w") then
    block.body:applyForce(0, -400)
  end
  if love.keyboard.isDown("s") then
    block.body:applyForce(0, 400)
  end

  dx = block.body:getX() - block.body_2:getX()
  dy = block.body:getY() - block.body_2:getY()
  dist = math.sqrt(dx * dx + dy * dy)

  block.body_2:applyForce(dx * 4 / dist, dy * 4 / dist)
end

function love.draw()
  love.graphics.setColor(102, 20, 99, 255)
  love.graphics.print(alpha, 20, 20)

  love.graphics.setColor(220, 6, 217, alpha)
  love.graphics.print("BlickBlock", 300, 200, 0, 1.5, 1.5)

  background:draw()
  block:draw()
end
