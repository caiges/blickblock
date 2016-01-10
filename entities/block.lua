Block = {}

function Block:new(world, x, y)
  local width = 50
  local height = 50

  body = love.physics.newBody(world, x, y, "dynamic")
  shape = love.physics.newRectangleShape(width, height)
  fixture = love.physics.newFixture(body, shape, 1)
  fixture:setRestitution(0)

  newObj = {
    x = x,
    y = y,
    width = width,
    height = height,
    segments = 100,
    body = body,
    shape = shape,
    fixture = fixture
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Block:draw()
  love.graphics.setColor(255, 255, 255)
  love.graphics.rectangle("fill", self.body:getX(), self.body:getY(), self.width, self.height)
end

return Block
