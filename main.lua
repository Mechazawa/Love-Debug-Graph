debugGraph = require 'debugGraph'

-- https://love2d.org/wiki/General_math
-- Returns 'n' rounded to the nearest 'deci'th (defaulting whole numbers).
function math.round(n, deci)
  deci = 10^(deci or 0)
  return math.floor(n*deci+.5)/deci
end

function love.load()
  fpsGraph = debugGraph:new('fps', 0, 0)
  memGraph = debugGraph:new('mem', 0, 30)
  dtGraph = debugGraph:new('custom', 0, 60)
end

function love.update(dt)

  -- Update the graphs
  fpsGraph:update(dt)
  memGraph:update(dt)

  -- Update our custom graph
  dtGraph:update(dt, math.floor(dt * 1000))
  dtGraph.label = 'DT: ' ..  math.round(dt, 4)
end

function love.draw()
  -- Draw graphs
  fpsGraph:draw()
  memGraph:draw()
  dtGraph:draw()
end

function love.keypressed(key)
  if key == 'escape' then
    love.event.quit()
  end
end
