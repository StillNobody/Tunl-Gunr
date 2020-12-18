function love.load()
  love.window.setTitle("Tunl Gunr 1.0")
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
        A = 1 -- Is active? 0 = off, 1 = init, 2 = active
  }

  a2 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 100 --Start Wait
  }

  a3 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 200 -- Start Wait
  }

  a4 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 300 -- Start Wait
  }

  a5 = {X = 0, -- X axis
        W = 1, -- Width
        Y = 0, -- Y axis
        Z = 0, -- Z axis with 1 being closest and 50 being furthest
        H = 1, -- Health
        A = 0, -- Is active? 0 = off, 1 = init, 2 = active
        SW = 400 -- Start Wait
  }

  timecount = 10
  cooldown = 0
  title = true
  credits = false
  score = 0
  shield = 100
  dead = false
  wait = 100
  music = love.audio.newSource("Teknoaxe - Synthwave E.ogg", "stream")
  shootsound = love.audio.newSource("shoot.ogg", "static")
  explosion = love.audio.newSource("explosion.ogg", "static")
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

  function shoot()
    if cooldown <= 0 then
      love.audio.play(shootsound)
      for i=1, 5 do
        checki(i)
        if aT.X >= 400 and aT.Y >= 300 then
          if mouseX() >= aT.X - (0.7 * aT.Z) and mouseX() <= (aT.X - (0.7 * aT.Z)) + aT.W and mouseY() >= aT.Y - (0.5 * aT.Z) and mouseY() <= (aT.Y - (0.5 * aT.Z) + aT.W) then
            aT.H = aT.H - 1
            if aT.H <= 0 then
              aT.A = 1
              score = score + 100
              love.audio.play(explosion)
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
              love.audio.play(explosion)
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
              love.audio.play(explosion)
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
              love.audio.play(explosion)
              hold = false
            end
          end
          --love.graphics.rectangle("line", aT.X - (0.7 * aT.Z), aT.Y + (0.5 * aT.Z), aT.W, aT.W)
        end -- If check
        cooldown = 10
      end -- For loop
    end -- Cooldown check
  end -- Shoot function
end -- load function

function love.update()
  love.audio.play(music)
  if title == true then
    if credits == true then
      love.mouse.setVisible(true)
      function love.draw()
        love.graphics.print("This game was made singlehandedly by Still Nobody (Zack) for Untitled Game Jam #38.", 100, 100)
        love.graphics.print("The theme of the jam was minimalism, which I decided to put into the graphics.", 100, 120)
        love.graphics.print("Tunl Gunr was coded in the language Lua using the LÖVE 2D game engine framework.", 100, 140)
        love.graphics.print("Inspiration came from the 1992 video game 'X' by Argonaut Games for the Nintendo Gameboy.", 100, 160)
        love.graphics.print("This is Tunl Gunr version 1.0 and it was released on December 13, 2020.", 100, 180)
        love.graphics.print("Music used is 'Synthwave E' by Teknoaxe. https://youtu.be/RBxnYXGNNAk", 100, 200)
        love.graphics.print("Here are some of my usernames for websites so you can follow me if you want.", 100, 220)
        love.graphics.print("Itch.io: StillNobody", 100, 240)
        love.graphics.print("GameJolt: @StillNobody", 100, 260)
        love.graphics.print("GitHub: StillNobody", 100, 280)
        love.graphics.print("YouTube: Still Nobody", 100, 300)
        love.graphics.print("Twitter: @StillNobody2", 100, 320)
        love.graphics.print("You can find the source code for Tunl Gunr on my GitHub page.", 100, 360)
        love.graphics.print("I encourage you to mod it and / or add your own features.", 100, 380)
        love.graphics.print("All I ask is that you include me in the credits as the orignal creator.", 100, 400)
        love.graphics.print("If you do mod the game, please tell me about it so I can play your mod :)", 100, 420)
        love.graphics.print("Thank you so much for playing my game!", 100, 460)
        --LINKS
        --Remind people about open source

        love.graphics.rectangle("line", 350, 500, 100, 50, 3, 3) -- Back button border
        love.graphics.line(360, 540, -- B
                           360, 510,
                           370, 515,
                           360, 520,
                           370, 530,
                           360, 540)
        love.graphics.line(380, 540, -- A
                           387, 510,
                           395, 540)
        love.graphics.line(382, 525,
                           392, 525)
        love.graphics.line(420, 510, -- C
                           405, 510,
                           405, 540,
                           420, 540)
        love.graphics.line(430, 510, -- K
                           430, 540)
        love.graphics.line(440, 510,
                           430, 525,
                           440, 540)

        love.graphics.print(mouseX().." ,"..mouseY())
      end
      if cooldown > 0 then
        cooldown = cooldown - 1
      end
      if love.mouse.isDown(1) then
        if mouseX() >= 350 and mouseX() <= 450 and mouseY() >= 500 and mouseY() <= 550 and cooldown <= 0 then
          credits = false
          cooldown = 20
        end
      end
    else
      --title
      love.mouse.setVisible(true)
      function love.draw()
        love.graphics.line(250, 80, -- T
                           175, 25)
        love.graphics.line(220, 60,
                           220, 225)
        love.graphics.line(375, 150, -- U
                           375, 225, 
                           300, 225,
                           300, 100)
        love.graphics.line(425, 225, -- N
                           425, 150,
                           500, 225,
                           500, 100)
        love.graphics.line(550, 225, -- L
                           625, 225,
                           625, 25)
        love.graphics.line(250, 275, -- G
                           175, 275,
                           175, 450,
                           250, 400,
                           250, 340,
                           200, 370)
        love.graphics.line(375, 275, -- U
                           375, 350,
                           300, 400,
                           300, 275)
        love.graphics.line(425, 350, -- N
                           425, 275,
                           500, 400,
                           500, 275)
        love.graphics.line(625, 475, -- R
                           625, 275,
                           550, 317,
                           625, 350,
                           550, 430)

        love.graphics.rectangle("line", 350, 400, 100, 50, 3, 3) -- Play button border
        love.graphics.line(360, 420, -- P
                           370, 420,
                           370, 410,
                           360, 410,
                           360, 440)
        love.graphics.line(380, 410, -- L
                           380, 440,
                           395, 440)
        love.graphics.line(405, 440, -- A
                           412, 410,
                           420, 440)
        love.graphics.line(410, 425,
                           415, 425)
        love.graphics.line(430, 410, -- Y
                           435, 420,
                           440, 410)
        love.graphics.line(435, 420,
                           435, 440)

        love.graphics.rectangle("line", 325, 500, 150, 50, 3, 3) -- Credit button border
        love.graphics.line(345, 510, -- C
                           335, 510,
                           335, 540,
                           345, 540)
        love.graphics.line(355, 540, -- R
                           355, 510,
                           365, 515,
                           355, 520,
                           365, 540)
        love.graphics.line(385, 510, -- E
                           375, 510,
                           375, 540,
                           385, 540)
        love.graphics.line(375, 520,
                           383, 520)
        love.graphics.line(395, 540, -- D
                           395, 510)
        love.graphics.line(395, 510,
                           405, 525,
                           395, 540)
        love.graphics.line(415, 510, -- I
                           425, 510)
        love.graphics.line(415, 540,
                           425, 540)
        love.graphics.line(420, 510,
                           420, 540)
        love.graphics.line(435, 510, -- T
                           445, 510)
        love.graphics.line(440, 510,
                           440, 540)
        love.graphics.line(465, 510, -- S
                           455, 520,
                           465, 530,
                           455, 540)
        love.graphics.print("SCORE: "..score, 380, 10)

      end -- Draw func
      if cooldown > 0 then
        cooldown = cooldown - 1
      end
      if love.mouse.isDown(1) then
        if mouseX() >= 325 and mouseX() <= 475 and mouseY() >= 500 and mouseY() <= 550 and cooldown <= 0 then
          credits = true
          cooldown = 20
        elseif mouseX() >= 350 and mouseX() <= 450 and mouseY() >= 400 and mouseY() <= 450 and cooldown <= 0 then
          title = false
          dead = false
          score = 0
          shield = 100
          wait = 100
          a2.SW = 100
          a3.SW = 200
          a4.SW = 300
          a5.SW = 400
          for i=2, 5 do
            checki(i)
            aT.A = 0
          end
        end
      end
    end -- credit check

  else -- title check
    if dead == false then
      if linex1 <= 0 then
        linex1 = 400
        liney1 = 300
        length1 = 0
        width1 = 0
        count1 = 1
      end
      if linex2 <= 0 then
        linex2 = 400
        liney2 = 300
        length2 = 0
        width2 = 0
        count2 = 1
      end
      if linex3 <= 0 then
        linex3 = 400
        liney3 = 300
        length3 = 0
        width3 = 0
        count3 = 1
      end
      if linex4 <= 0 then
        linex4 = 400
        liney4 = 300
        length4 = 0
        width4 = 0
        count4 = 1
      end
      length1 = length1 + (2 * count1)
      width1 = width1 + (2 * count1)
      linex1 = linex1 - (1 * count1)
      liney1 = liney1 - (1 * count1)
      count1 = count1 + 0.05

      length2 = length2 + (2 * count2)
      width2 = width2 + (2 * count2)
      linex2 = linex2 - (1 * count2)
      liney2 = liney2 - (1 * count2)
      count2 = count2 + 0.05

      length3 = length3 + (2 * count3)
      width3 = width3 + (2 * count3)
      linex3 = linex3 - (1 * count3)
      liney3 = liney3 - (1 * count3)
      count3 = count3 + 0.05

      length4 = length4 + (2 * count4)
      width4 = width4 + (2 * count4)
      linex4 = linex4 - (1 * count4)
      liney4 = liney4 - (1 * count4)
      count4 = count4 + 0.05

      --Alien init
      for i=1, 5 do
        checki(i)
        if aT.A == 1 then
          aT.X = love.math.random(200, 600)
          aT.Y = love.math.random(100, 500)
          aT.Z = 50
          aT.H = 1
          aT.W = 150
          for i = 1, 50 do
            aT.W = aT.W / 1.15
          end
          aT.A = 2
        end
      end


      function love.draw()
        --Tunnel
        love.graphics.rectangle("line", linex1, liney1, length1, width1)
        love.graphics.rectangle("line", linex2, liney2, length2, width2)
        love.graphics.rectangle("line", linex3, liney3, length3, width3)
        love.graphics.rectangle("line", linex4, liney4, length4, width4)
        love.graphics.line(100, 0, 390, 290)
        love.graphics.line(700, 0, 410, 290)
        love.graphics.line(100, 600, 390, 310)
        love.graphics.line(700, 600, 410, 310)
        love.graphics.rectangle("line", 390, 290, 20, 20)
        love.graphics.print(mouseX()..", "..mouseY(), 0, 0)
        love.graphics.print("SCORE: "..score, 380, 10)
        love.graphics.print("SHIELD: "..shield, 380, 50)

        for i=1, 5 do
          checki(i)
          if aT.A == 2 then
            if aT.X >= 400 and aT.Y >= 300 then
              love.graphics.rectangle("line", aT.X - (0.7 * aT.Z), aT.Y - (0.5 * aT.Z), aT.W, aT.W)
            elseif aT.X <= 400 and aT.Y <= 300 then
              love.graphics.rectangle("line", aT.X + (0.7 * aT.Z), aT.Y + (0.5 * aT.Z), aT.W, aT.W)
            elseif aT.X <= 400 and aT.Y >= 300 then
              love.graphics.rectangle("line", aT.X + (0.7 * aT.Z), aT.Y - (0.5 * aT.Z), aT.W, aT.W)
            elseif aT.X >= 400 and aT.Y <= 300 then
              love.graphics.rectangle("line", aT.X - (0.7 * aT.Z), aT.Y + (0.5 * aT.Z), aT.W, aT.W)
            end
          end
        end

        --Crosshairs
        love.graphics.line(mouseX()-5, mouseY(), mouseX()-20, mouseY())
        love.graphics.line(mouseX()+5, mouseY(), mouseX()+20, mouseY())
        love.graphics.line(mouseX(), mouseY()-5, mouseX(), mouseY()-15)
        love.graphics.line(mouseX(), mouseY()+5, mouseX(), mouseY()+15)
        love.graphics.line(mouseX()-20, mouseY()-5, mouseX()-20, mouseY()-15, mouseX()-5, mouseY()-15)
        love.graphics.line(mouseX()-20, mouseY()+5, mouseX()-20, mouseY()+15, mouseX()-5, mouseY()+15)
        love.graphics.line(mouseX()+20, mouseY()-5, mouseX()+20, mouseY()-15, mouseX()+5, mouseY()-15)
        love.graphics.line(mouseX()+20, mouseY()+5, mouseX()+20, mouseY()+15, mouseX()+5, mouseY()+15)
      end

      love.mouse.setVisible(false)
      if love.mouse.isDown(1) then
        shoot()
      end

      if cooldown > 0 then cooldown = cooldown - 1 end
      timecount = timecount - 1

      for i=1, 5 do
        checki(i)
        if aT.A == 2 and timecount <= 1 then
          aT.W = aT.W * 1.15
          aT.Z = aT.Z - 1
          if aT.Z < 1 then
            aT.A = 1
            shield = shield - 10
            love.audio.play(explosion)
          end
        end
      end

      if timecount <= 0 then
        timecount = 10
      end

      for i=2, 5 do
        checki(i)
        if aT.SW > 0 then
          aT.SW = aT.SW - 1
        elseif aT.SW == 0 then
          aT.A = 1
          aT.SW = -1
        end -- If check
      end -- for loop

      if score % 3000 == 0 and hold == false then
        shield = shield + 10
        hold = true
        love.audio.play(bonus)
      end

      if shield <= 0 then
        dead = true
      end
    elseif dead == true then
      --die
      love.mouse.setVisible(true)
      function love.draw()
        love.graphics.line(200, 100, -- Y
                           250, 150,
                           300, 100)
        love.graphics.line(250, 150,
                           250, 200)
        love.graphics.rectangle("line", 350, 100, 100, 100) -- O
        love.graphics.line(500, 100, -- U
                           500, 200,
                           600, 200,
                           600, 100)
        love.graphics.line(125, 250, -- D
                           125, 350)
        love.graphics.line(125, 250,
                           225, 300,
                           125, 350)
        love.graphics.line(275, 250, -- I
                           375, 250)
        love.graphics.line(275, 350,
                           375, 350)
        love.graphics.line(325, 250,
                           325, 350)
        love.graphics.line(525, 250, -- E
                           425, 250,
                           425, 350,
                           525, 350)
        love.graphics.line(425, 300,
                           515, 300)
        love.graphics.line(575, 250, -- D
                           575, 350)
        love.graphics.line(575, 250,
                           675, 300,
                           575, 350)
        love.graphics.print("SCORE: "..score, 380, 10)
      end
      if wait > 0  then
        wait = wait - 1
      else
        title = true
      end
    end
  end -- title check
end -- update loop