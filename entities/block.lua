Block = {}

function Block:new(world, x, y)
  local width = 50
  local height = 50

  body = love.physics.newBody(world, x, y, "dynamic")
  shape = love.physics.newRectangleShape(width, height)
  fixture = love.physics.newFixture(body, shape, 1)
  fixture:setRestitution(0)

  body_2 = love.physics.newBody(world, x + 100, y + 100, "dynamic")
  shape_2 = love.physics.newRectangleShape(width, height)
  fixture_2 = love.physics.newFixture(body_2, shape_2, 1)
  fixture_2:setRestitution(0)

  newObj = {
    x = x,
    y = y,
    width = width,
    height = height,
    segments = 100,
    body = body,
    body_2 = body_2,
    shape = shape,
    shape_2 = shape_2,
    fixture = fixture,
    fixture_2 = fixture_2
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Block:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", self.body:getX(), self.body:getY(), self.width, self.height)

  love.graphics.rectangle("fill", self.body_2:getX(), self.body_2:getY(), self.width, self.height)
end

return Block
