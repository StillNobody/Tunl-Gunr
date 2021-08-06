    if dead == false then
      if pausecheck == true then
        options()
        if love.keyboard.isDown("escape") and (wait == 0) then
          pausecheck = false
          wait = 20
          love.mouse.setVisible(false)
          love.mouse.setGrabbed(true)
        end
        if wait > 0 then wait = wait - 1 end
      else
        if wait > 0 then wait = wait - 1 end
        if love.keyboard.isDown("escape") and (wait == 0) then 
          pausecheck = true
          wait = 20
          love.mouse.setVisible(true)
          love.mouse.setGrabbed(false)
        end

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
          love.graphics.setColor(1, 1, 1)
          love.graphics.rectangle("line", linex1, liney1, length1, width1)
          love.graphics.rectangle("line", linex2, liney2, length2, width2)
          love.graphics.rectangle("line", linex3, liney3, length3, width3)
          love.graphics.rectangle("line", linex4, liney4, length4, width4)
          love.graphics.line(100, 0, 390, 290)
          love.graphics.line(700, 0, 410, 290)
          love.graphics.line(100, 600, 390, 310)
          love.graphics.line(700, 600, 410, 310)
          love.graphics.rectangle("line", 390, 290, 20, 20)
          love.graphics.print("SCORE: "..score, 380, 10)
          love.graphics.print("SHIELD: "..shield, 380, 50)

          --Aliens
          for i=1, 5 do
            checki(i)
            alienColor()
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
          love.graphics.setColor(1, 1, 1)
          love.graphics.line(mouseX()-5, mouseY(), mouseX()-20, mouseY())
          love.graphics.line(mouseX()+5, mouseY(), mouseX()+20, mouseY())
          love.graphics.line(mouseX(), mouseY()-5, mouseX(), mouseY()-15)
          love.graphics.line(mouseX(), mouseY()+5, mouseX(), mouseY()+15)

          love.graphics.line(mouseX()-20, mouseY()+15, mouseX()-5-(15/30*cooldown), mouseY()+15)
          love.graphics.line(mouseX()-20, mouseY()-15, mouseX()-5-(15/30*cooldown), mouseY()-15)
          love.graphics.line(mouseX()+20, mouseY()+15, mouseX()+5+(15/30*cooldown), mouseY()+15)
          love.graphics.line(mouseX()+20, mouseY()-15, mouseX()+5+(15/30*cooldown), mouseY()-15)

          love.graphics.line(mouseX()-20, mouseY()+15, mouseX()-20, mouseY()+5+(10/30*cooldown))
          love.graphics.line(mouseX()+20, mouseY()+15, mouseX()+20, mouseY()+5+(10/30*cooldown))
          love.graphics.line(mouseX()-20, mouseY()-15, mouseX()-20, mouseY()-5-(10/30*cooldown))
          love.graphics.line(mouseX()+20, mouseY()-15, mouseX()+20, mouseY()-5-(10/30*cooldown))
          --[[love.graphics.line(mouseX()-20, mouseY()-5, mouseX()-20, mouseY()-15, mouseX()-5, mouseY()-15)
          love.graphics.line(mouseX()-20, mouseY()+5, mouseX()-20, mouseY()+15, mouseX()-5, mouseY()+15)
          love.graphics.line(mouseX()+20, mouseY()-5, mouseX()+20, mouseY()-15, mouseX()+5, mouseY()-15)
          love.graphics.line(mouseX()+20, mouseY()+5, mouseX()+20, mouseY()+15, mouseX()+5, mouseY()+15)]]
          love.graphics.setBackgroundColor(0, 0, 0)
        end

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
              love.graphics.setBackgroundColor(1, 0, 0)
              local hitcheck = love.math.random(4)
              if hitcheck == hitcache then
                if hitcheck == 1 or hitcheck == 3 then
                  hitcheck = hitcheck + 1
                elseif hitcheck == 2 or hitcheck == 4 then
                  hitcheck = hitcheck - 1
                end
              end
              hitcache = tostring(hitcheck)
              hitcache = tonumber(hitcache)
              love.audio.play(hit[hitcheck])
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

        if score % 5000 == 0 and hold == false then
          shield = shield + 10
          hold = true
          love.audio.play(bonus)
        end

        if shield <= 0 then
          dead = true
          wait = 150
        end
      end -- pausecheck
    elseif dead == true then
      --die
      love.mouse.setVisible(true)
      love.mouse.setGrabbed(false)
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
        title = 1
        titlescramble = 0
      end
    end