function love.load()
  love.window.setTitle("Tunl Gunr 1.1")
  linex1 = 400
  liney1 = 300
  length1 = 0
  width1 = 0

  linex2 = 300
  liney2 = 200
  length2 = 200
  width2 = 200

  linex3 = 200
  liney3 = 100
  length3 = 400
  width3 = 400

  linex4 = 100
  liney4 = 0
  length4 = 800
  width4 = 800

  count1 = 1
  count2 = 2
  count3 = 3
  count4 = 4

  function mouseX()
    return love.mouse.getX()
  end
  function mouseY()
    return love.mouse.getY()
  end


  --Alien 1
  a1 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 1, -- Is active? 0 = off, 1 = init, 2 = active
        DR = 1, -- Draw Red
        DG = 1 -- Draw Green
  }

  a2 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 100, --Start Wait
        DR = 1, -- Draw Red
        DG = 1 -- Draw Green
  }

  a3 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 200, -- Start Wait
        DR = 1, -- Draw Red
        DG = 1 -- Draw Green
  }

  a4 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 300, -- Start Wait
        DR = 1, -- Draw Red
        DG = 1 -- Draw Green
  }

  a5 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 400, -- Start Wait
        DR = 1, -- Draw Red
        DG = 1 -- Draw Green
  }

  scramble = {}
  for scramnum = 1, 70 do
    scramble[scramnum] = love.math.random(-100, 100)
  end
  scramindex = {}
  for scramnum = 1, 70 do
    scramindex[scramnum] = scramble[scramnum] / 100
  end

  settingcheck = false
  TRFlip = false
  TGFlip = true
  TBFlip = false
  titleRed = love.math.random()
  titleGreen = love.math.random()
  titleBlue = love.math.random()
  shots = 0
  hits = 0
  pausecheck = false
  titlescramble = 0
  titlebob = 10
  titleflip = false
  timecount = 10
  cooldown = 0
  title = 1 -- 0 = off, 1 = main, 2 = settings, 3 = credits
  score = 0
  shield = 100
  dead = false
  wait = 0
  pause = love.graphics.newImage("pause.png")
  gear = love.graphics.newImage("Gear-1.png")
  settings = love.graphics.newImage("settings.png")
  play = love.graphics.newImage("play.png")
  credits = love.graphics.newImage("credits.png")
  back = love.graphics.newImage("back.png")
  settingNumbers = love.graphics.newImage("numbers.png")
  setNum = {love.graphics.newQuad(380, 0, 50, 50, settingNumbers), -- #0 indexed @ [1]
            love.graphics.newQuad(0, 0, 30, 50, settingNumbers), -- #1 indexed @ [2]
            love.graphics.newQuad(40, 0, 40, 50, settingNumbers), -- #2 indexed @ [3]
            love.graphics.newQuad(90, 0, 30, 50, settingNumbers), -- #3 indexed @ [4]
            love.graphics.newQuad(130, 0, 30, 50, settingNumbers), -- #4 indexed @ [5]
            love.graphics.newQuad(170, 0, 30, 50, settingNumbers), -- #5 indexed @ [6]
            love.graphics.newQuad(210, 0, 30, 50, settingNumbers), -- #6 indexed @ [7]
            love.graphics.newQuad(250, 0, 30, 50, settingNumbers), -- #7 indexed @ [8]
            love.graphics.newQuad(290, 0, 40, 50, settingNumbers), -- #8 indexed @ [9]
            love.graphics.newQuad(340, 0, 30, 50, settingNumbers), -- #9 indexed @ [10]
            }
  music = love.audio.newSource("Teknoaxe - Synthwave E.ogg", "stream")
  music:setVolume(0.5)
  shootsound = {love.audio.newSource("shoot1.ogg", "static"),
                love.audio.newSource("shoot1.ogg", "static"),
                love.audio.newSource("shoot2.ogg", "static"),
                love.audio.newSource("shoot2.ogg", "static")}
  explosion = {love.audio.newSource("explosion1.ogg", "static"),
               love.audio.newSource("explosion1.ogg", "static"),
               love.audio.newSource("explosion2.ogg", "static"),
               love.audio.newSource("explosion2.ogg", "static")}
  hit = {love.audio.newSource("hit1.ogg", "static"),
         love.audio.newSource("hit1.ogg", "static"),
         love.audio.newSource("hit2.ogg", "static"),
         love.audio.newSource("hit2.ogg", "static")}
  shootsoundcache = 1
  explosioncache = 1
  hitcache = 1
  bonus = love.audio.newSource("bonus.ogg", "static")

  function checki(i)
    if i == 1 then
      aT = a1
    elseif i == 2 then
      aT = a2
    elseif i == 3 then
      aT = a3
    elseif i == 4 then
      aT = a4
    elseif i == 5 then
      aT = a5
    end
  end

  function alienColor()
    -- Set Green Value
    if aT.Z > 25 then
      aT.DG = 1
    else
      local zModG = aT.Z * (1/25)
      aT.DG = 0 + zModG
    end
    -- Set Red Value
    if aT.Z > 25 then
      local zModR = (aT.Z - 25) * (1/25)
      aT.DR = 1 - zModR
    else
      aT.DR = 1
    end
    love.graphics.setColor(aT.DR, aT.DG, 0)
  end

  function shoot()
    if cooldown <= 0 then
      local shootsoundcheck = love.math.random(4)
      if shootsoundcheck == shootsoundcache then
        if shootsoundcheck == 1 or shootsoundcheck == 3 then
          shootsoundcheck = shootsoundcheck + 1
        elseif shootsoundcheck == 2 or shootsoundcheck == 4 then
          shootsoundcheck = shootsoundcheck - 1
        end
      end
      love.audio.play(shootsound[shootsoundcheck])
      shootsoundcache = tostring(shootsoundcheck)
      shootsoundcache =tonumber(shootsoundcache)
      local explosioncheck = love.math.random(4)
      if explosioncheck == explosioncache then
        if explosioncheck == 1 or explosioncheck == 3 then
          explosioncheck = explosioncheck + 1
        elseif explosioncheck == 2 or explosioncheck == 4 then
          explosioncheck = explosioncheck - 1
        end
      end
      explosioncache = tostring(explosioncheck)
      explosioncache = tonumber(explosioncache)
      shots = shots + 1
      for i=1, 5 do
        checki(i)
        if aT.X >= 400 and aT.Y >= 300 then
          if mouseX() >= aT.X - (0.7 * aT.Z) and mouseX() <= (aT.X - (0.7 * aT.Z)) + aT.W and mouseY() >= aT.Y - (0.5 * aT.Z) and mouseY() <= (aT.Y - (0.5 * aT.Z) + aT.W) then
            aT.H = aT.H - 1
            if aT.H <= 0 then
              aT.A = 1
              score = score + 100
              hits = hits + 1
              love.audio.play(explosion[explosioncache])
              hold = false
            end
          end
          --love.graphics.rectangle("line", aT.X - (0.7 * aT.Z), aT.Y - (0.5 * aT.Z), aT.W, aT.W)
        elseif aT.X <= 400 and aT.Y <= 300 then
          if mouseX() >= aT.X + (0.7 * aT.Z) and mouseX() <= (aT.X + (0.7 * aT.Z)) + aT.W and mouseY() >= aT.Y + (0.5 * aT.Z) and mouseY() <= (aT.Y + (0.5 * aT.Z) + aT.W) then
            aT.H = aT.H - 1
            if aT.H <= 0 then
              aT.A = 1
              score = score + 100
              hits = hits + 1
              love.audio.play(explosion[explosioncache])
              hold = false
            end
          end
          --love.graphics.rectangle("line", aT.X + (0.7 * aT.Z), aT.Y + (0.5 * aT.Z), aT.W, aT.W)
        elseif aT.X <= 400 and aT.Y >= 300 then
          if mouseX() >= aT.X + (0.7 * aT.Z) and mouseX() <= (aT.X + (0.7 * aT.Z)) + aT.W and mouseY() >= aT.Y - (0.5 * aT.Z) and mouseY() <= (aT.Y - (0.5 * aT.Z) + aT.W) then
            aT.H = aT.H - 1
            if aT.H <= 0 then
              aT.A = 1
              score = score + 100
              hits = hits + 1
              love.audio.play(explosion[explosioncache])
              hold = false
            end
          end
          --love.graphics.rectangle("line", aT.X + (0.7 * aT.Z), aT.Y - (0.5 * aT.Z), aT.W, aT.W)
        elseif aT.X >= 400 and aT.Y <= 300 then
          if mouseX() >= aT.X - (0.7 * aT.Z) and mouseX() <= (aT.X - (0.7 * aT.Z)) + aT.W and mouseY() >= aT.Y + (0.5 * aT.Z) and mouseY() <= (aT.Y + (0.5 * aT.Z) + aT.W) then
            aT.H = aT.H - 1
            if aT.H <= 0 then
              aT.A = 1
              score = score + 100
              hits = hits + 1
              love.audio.play(explosion[explosioncache])
              hold = false
            end
          end
          --love.graphics.rectangle("line", aT.X - (0.7 * aT.Z), aT.Y + (0.5 * aT.Z), aT.W, aT.W)
        end -- If check
        cooldown = 30
      end -- For loop
    end -- Cooldown check
  end -- Shoot function

  function options()
    function love.draw()
      love.graphics.draw(settings, 140, 100)
      if pausecheck == true then love.graphics.draw(pause, 325, 15, 0, 1.5, 1.5) end
      if pausecheck == false then love.graphics.draw(back, 368, 500) end
      if music:getVolume() >= 0 and music:getVolume() < 0.01 then
        love.graphics.draw(settingNumbers, setNum[1], 530, 190)
      elseif music:getVolume() > 0.09 and music:getVolume() < 0.11 then
        love.graphics.draw(settingNumbers, setNum[2], 530, 190)
      elseif music:getVolume() > 0.19 and music:getVolume() < 0.21 then
        love.graphics.draw(settingNumbers, setNum[3], 530, 190)
      elseif music:getVolume() > 0.29 and music:getVolume() < 0.31 then
        love.graphics.draw(settingNumbers, setNum[4], 530, 190)
      elseif music:getVolume() > 0.39 and music:getVolume() < 0.41 then
        love.graphics.draw(settingNumbers, setNum[5], 530, 190)
      elseif music:getVolume() > 0.49 and music:getVolume() < 0.51 then
        love.graphics.draw(settingNumbers, setNum[6], 530, 190)
      elseif music:getVolume() > 0.59 and music:getVolume() < 0.61 then
        love.graphics.draw(settingNumbers, setNum[7], 530, 190)
      elseif music:getVolume() > 0.69 and music:getVolume() < 0.71 then
        love.graphics.draw(settingNumbers, setNum[8], 530, 190)
      elseif music:getVolume() > 0.79 and music:getVolume() < 0.81 then
        love.graphics.draw(settingNumbers, setNum[9], 530, 190)
      elseif music:getVolume() > 0.89 and music:getVolume() < 0.91 then
        love.graphics.draw(settingNumbers, setNum[10], 530, 190)
      elseif music:getVolume() > 0.99 and music:getVolume() < 1.01 then
        love.graphics.draw(settingNumbers, setNum[2], 510, 190)
        love.graphics.draw(settingNumbers, setNum[1], 540, 190)
      end
      if shootsound[1]:getVolume() >= 0 and shootsound[1]:getVolume() < 0.01 then
        love.graphics.draw(settingNumbers, setNum[1], 530, 260)
      elseif shootsound[1]:getVolume() > 0.09 and shootsound[1]:getVolume() < 0.11 then
        love.graphics.draw(settingNumbers, setNum[2], 530, 260)
      elseif shootsound[1]:getVolume() > 0.19 and shootsound[1]:getVolume() < 0.21 then
        love.graphics.draw(settingNumbers, setNum[3], 530, 260)
      elseif shootsound[1]:getVolume() > 0.29 and shootsound[1]:getVolume() < 0.31 then
        love.graphics.draw(settingNumbers, setNum[4], 530, 260)
      elseif shootsound[1]:getVolume() > 0.39 and shootsound[1]:getVolume() < 0.41 then
        love.graphics.draw(settingNumbers, setNum[5], 530, 260)
      elseif shootsound[1]:getVolume() > 0.49 and shootsound[1]:getVolume() < 0.51 then
        love.graphics.draw(settingNumbers, setNum[6], 530, 260)
      elseif shootsound[1]:getVolume() > 0.59 and shootsound[1]:getVolume() < 0.61 then
        love.graphics.draw(settingNumbers, setNum[7], 530, 260)
      elseif shootsound[1]:getVolume() > 0.69 and shootsound[1]:getVolume() < 0.71 then
        love.graphics.draw(settingNumbers, setNum[8], 530, 260)
      elseif shootsound[1]:getVolume() > 0.79 and shootsound[1]:getVolume() < 0.81 then
        love.graphics.draw(settingNumbers, setNum[9], 530, 260)
      elseif shootsound[1]:getVolume() > 0.89 and shootsound[1]:getVolume() < 0.91 then
        love.graphics.draw(settingNumbers, setNum[10], 530, 260)
      elseif shootsound[1]:getVolume() > 0.99 and shootsound[1]:getVolume() < 1.01 then
        love.graphics.draw(settingNumbers, setNum[2], 510, 260)
        love.graphics.draw(settingNumbers, setNum[1], 540, 260)
      end
    end
    for i = 1, 4 do
      shootsound[i]:setVolume(shootsound[1]:getVolume())
      explosion[i]:setVolume(shootsound[1]:getVolume())
      hit[i]:setVolume(shootsound[1]:getVolume())
    end
    bonus:setVolume(shootsound[1]:getVolume())
    if love.mouse.isDown(1) and (wait == 0) then
      if mouseX() >= 450 and mouseX() <= 500 and mouseY() >= 190 and mouseY() <= 240 then --music vol -
        music:setVolume(round((music:getVolume() - 0.1), 1))
        wait = 15
      elseif mouseX() >= 610 and mouseX() <= 660 and mouseY() >= 190 and mouseY() <= 240 then --music vol +
        music:setVolume(round((music:getVolume() + 0.1), 1))
        if music:getVolume() > 1 then music:setVolume(1) end
        wait = 15
      elseif mouseX() >= 450 and mouseX() <= 500 and mouseY() >= 260 and mouseY() <= 310 then --sound vol -
        shootsound[1]:setVolume(round((shootsound[1]:getVolume() - 0.1), 1))
        wait = 15
      elseif mouseX() >= 610 and mouseX() <= 660 and mouseY() >= 260 and mouseY() <= 310 then --sound vol +
        shootsound[1]:setVolume(round((shootsound[1]:getVolume() + 0.1), 1))
        if shootsound[1]:getVolume() > 1 then shootsound[1]:setVolume(1) end
        wait = 15
      elseif mouseX() >= 368 and mouseX() <= 432 and mouseY() >= 500 and mouseY() <= 564 and pausecheck == false then --main title
        title = 1
        titlescramble = 0
        wait = 20
      end
    end
  end
  function round(num, numDecimalPlaces)
    local mult = 10^(numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
  end
end -- load function