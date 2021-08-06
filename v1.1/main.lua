initload = love.filesystem.load("load.lua")
titlefunc = love.filesystem.load("title.lua")
gameloop = love.filesystem.load("gameloop.lua")

initload()

function love.update(dt)
  love.audio.play(music)
  if title > 0 then
    titlefunc()
  else -- title check
    gameloop()
  end -- title check
end -- update loop