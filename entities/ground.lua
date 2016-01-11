require('../utils/trace')

Ground = {}

function Ground:new(world)
  local width = love.window.getWidth()
  local height = 5

  body = love.physics.newBody(world, love.window.getWidth() / 2, 500, 'static')
  shape = love.physics.newRectangleShape(width, height)
  fixture = love.physics.newFixture(body, shape)
  x1, y1, x2, y2, x3, y3, x4, y4 = body:getWorldPoints(shape:getPoints())
  trace.print(x1, trace.styles.yellow)
  trace.print(y1, trace.styles.yellow)
  trace.print(x2, trace.styles.yellow)
  trace.print(y2, trace.styles.yellow)
  trace.print(x3, trace.styles.yellow)
  trace.print(y3, trace.styles.yellow)
  trace.print(x4, trace.styles.yellow)
  trace.print(y4, trace.styles.yellow)

  newObj = {
    x = x,
    y = y,
    width = width,
    height = height,
    body = body,
    shape = shape,
    fixture = fixture
  }
  self.__index = self
  return setmetatable(newObj, self)
end

function Ground:draw()
  love.graphics.setColor(188, 106, 83)
  love.graphics.polygon('line', self.body:getWorldPoints(self.shape:getPoints()))
end

return Ground