Löve Debug Graph
------------------

A Löve2D graph tool for drawing FPS, memory or custom graphs.

![](http://i.imgur.com/YiliXZQ.png)

## Usage

```lua
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
```

## Configuration

Key      | Default       | Description
---------|---------------|----------------------------
x        | 0             | The X position of the graph
y        | 0             | The Y position of the graph
width    | 50            | The graph width
height   | 30            | The graph height
delay    | 0.5           | The update delay in seconds
label    | #graph type#  | The graph label
font     | Vera Sans 8px | The label font
