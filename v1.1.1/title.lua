love.graphics.setColor(1, 1, 1)
if wait > 0 then
  wait = wait - 1
end
    if title == 3 then -- Are we on the credits menu?
      love.mouse.setVisible(true)
      function love.draw()
        love.graphics.print("This game was made singlehandedly by Still Nobody (Zack) for Untitled Game Jam #38.", 100, 100)
        love.graphics.print("The theme of the jam was minimalism, which I decided to put into the graphics.", 100, 120)
        love.graphics.print("Tunl Gunr was coded in the language Lua using the LÖVE 2D game engine framework.", 100, 140)
        love.graphics.print("Inspiration came from the 1992 video game 'X' by Argonaut Games for the Nintendo Gameboy.", 100, 160)
        love.graphics.print("This is Tunl Gunr version 1.1.1 and it was released on August 8, 2021.", 100, 180)
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

        love.graphics.draw(back, 368, 500)
      end
      if love.mouse.isDown(1) then
        if mouseX() >= 368 and mouseX() <= 432 and mouseY() >= 500 and mouseY() <= 564 then --go back
          title = 1
          titlescramble = 0
          wait = 20
        end
      end
    elseif title == 2 then
      --settings
      options()
    else
      --title
      love.mouse.setVisible(true)
      if (titlebob > -10) and (titleflip == false) then
        titlebob = titlebob - 0.5
      elseif (titlebob < 10) and (titleflip == true) then
        titlebob = titlebob + 0.5
      elseif (titlebob == -10) then
        titleflip = true
        titlebob = titlebob + 0.5
      elseif (titlebob == 10) then
        titleflip = false
        titlebob = titlebob - 0.5
      end
      if titlescramble < 100 then titlescramble = titlescramble + 1 end
      function love.draw()
        if TRFlip == false then
            titleRed = titleRed + 0.01
            if titleRed >= 1 then TRFlip = true end
        else
            titleRed = titleRed - 0.01
            if titleRed <= 0 then TRFlip = false end
        end
        if TGFlip == false then
            titleGreen = titleGreen + 0.01
            if titleGreen >= 1 then TGFlip = true end
        else
            titleGreen = titleGreen - 0.01
            if titleGreen <= 0 then TGFlip = false end
        end
        if TBFlip == false then
            titleBlue = titleBlue + 0.01
            if titleBlue >= 1 then TBFlip = true end
        else
            titleBlue = titleBlue - 0.01
            if titleBlue <= 0 then TBFlip = false end
        end
        love.graphics.setColor(titleRed, titleGreen, titleBlue)
        love.graphics.line(250 + scramble[1] - (scramindex[1] * titlescramble), 80 + scramble[35] - (scramindex[35] * titlescramble) + titlebob, -- T
                           175 + scramble[2] - (scramindex[2] * titlescramble), 25 + scramble[36] - (scramindex[36] * titlescramble) + titlebob)
        love.graphics.line(220 + scramble[3] - (scramindex[3] * titlescramble), 60 + scramble[37] - (scramindex[37] * titlescramble) + titlebob,
                           220 + scramble[4] - (scramindex[4] * titlescramble), 225 + scramble[38] - (scramindex[38] * titlescramble) + titlebob)
        love.graphics.line(375 + scramble[5] - (scramindex[5] * titlescramble), 150 + scramble[39] - (scramindex[39] * titlescramble) + titlebob, -- U
                           375 + scramble[6] - (scramindex[6] * titlescramble), 225 + scramble[40] - (scramindex[40] * titlescramble) + titlebob, 
                           300 + scramble[7] - (scramindex[7] * titlescramble), 225 + scramble[41] - (scramindex[41] * titlescramble) + titlebob,
                           300 + scramble[8] - (scramindex[8] * titlescramble), 100 + scramble[42] - (scramindex[42] * titlescramble) + titlebob)
        love.graphics.line(425 + scramble[9] - (scramindex[9] * titlescramble), 225 + scramble[43] - (scramindex[43] * titlescramble) + titlebob, -- N
                           425 + scramble[10] - (scramindex[10] * titlescramble), 150 + scramble[44] - (scramindex[44] * titlescramble) + titlebob,
                           500 + scramble[11] - (scramindex[11] * titlescramble), 225 + scramble[45] - (scramindex[45] * titlescramble) + titlebob,
                           500 + scramble[12] - (scramindex[12] * titlescramble), 100 + scramble[46] - (scramindex[46] * titlescramble) + titlebob)
        love.graphics.line(550 + scramble[13] - (scramindex[13] * titlescramble), 225 + scramble[47] - (scramindex[47] * titlescramble) + titlebob, -- L
                           625 + scramble[14] - (scramindex[14] * titlescramble), 225 + scramble[48] - (scramindex[48] * titlescramble) + titlebob,
                           625 + scramble[15] - (scramindex[15] * titlescramble), 25 + scramble[49] - (scramindex[49] * titlescramble) + titlebob)
        love.graphics.line(250 + scramble[16] - (scramindex[16] * titlescramble), 275 + scramble[50] - (scramindex[50] * titlescramble) + titlebob, -- G
                           175 + scramble[17] - (scramindex[17] * titlescramble), 275 + scramble[51] - (scramindex[51] * titlescramble) + titlebob,
                           175 + scramble[18] - (scramindex[18] * titlescramble), 450 + scramble[52] - (scramindex[52] * titlescramble) + titlebob,
                           250 + scramble[19] - (scramindex[19] * titlescramble), 400 + scramble[53] - (scramindex[53] * titlescramble) + titlebob,
                           250 + scramble[20] - (scramindex[20] * titlescramble), 340 + scramble[54] - (scramindex[54] * titlescramble) + titlebob,
                           200 + scramble[21] - (scramindex[21] * titlescramble), 370 + scramble[55] - (scramindex[55] * titlescramble) + titlebob)
        love.graphics.line(375 + scramble[22] - (scramindex[22] * titlescramble), 275 + scramble[56] - (scramindex[56] * titlescramble) + titlebob, -- U
                           375 + scramble[23] - (scramindex[23] * titlescramble), 350 + scramble[57] - (scramindex[57] * titlescramble) + titlebob,
                           300 + scramble[24] - (scramindex[24] * titlescramble), 400 + scramble[58] - (scramindex[58] * titlescramble) + titlebob,
                           300 + scramble[25] - (scramindex[25] * titlescramble), 275 + scramble[59] - (scramindex[59] * titlescramble) + titlebob)
        love.graphics.line(425 + scramble[26] - (scramindex[26] * titlescramble), 350 + scramble[60] - (scramindex[60] * titlescramble) + titlebob, -- N
                           425 + scramble[27] - (scramindex[27] * titlescramble), 275 + scramble[61] - (scramindex[61] * titlescramble) + titlebob,
                           500 + scramble[28] - (scramindex[28] * titlescramble), 400 + scramble[62] - (scramindex[62] * titlescramble) + titlebob,
                           500 + scramble[29] - (scramindex[29] * titlescramble), 275 + scramble[63] - (scramindex[63] * titlescramble) + titlebob)
        love.graphics.line(625 + scramble[30] - (scramindex[30] * titlescramble), 475 + scramble[64] - (scramindex[64] * titlescramble) + titlebob, -- R
                           625 + scramble[31] - (scramindex[31] * titlescramble), 275 + scramble[65] - (scramindex[65] * titlescramble) + titlebob,
                           550 + scramble[32] - (scramindex[32] * titlescramble), 317 + scramble[66] - (scramindex[66] * titlescramble) + titlebob,
                           625 + scramble[33] - (scramindex[33] * titlescramble), 350 + scramble[67] - (scramindex[67] * titlescramble) + titlebob,
                           550 + scramble[34] - (scramindex[34] * titlescramble), 430 + scramble[68] - (scramindex[68] * titlescramble) + titlebob)
        love.graphics.setColor(1, 1, 1)
        love.graphics.draw(play, 368, 500)
        love.graphics.draw(credits, 36, 500)
        love.graphics.draw(gear, 700, 500, 0, 0.5, 0.5)
        love.graphics.print("SCORE: "..score, 380, 10)
        love.graphics.print("HIT RATIO: " .. math.floor(hits / shots * 100 + 0.5) .. "%", 370, 25)
      end -- Draw func

      if love.mouse.isDown(1) and wait <= 0 then
        if mouseX() >= 36 and mouseX() <= 100 and mouseY() >= 500 and mouseY() <= 564 then
          title = 3 -- go to credits
          wait = 20
        elseif mouseX() >= 700 and mouseX() <= 764 and mouseY() >= 500 and mouseY() <= 564 then
          title = 2 -- go to settings
          wait = 20
        elseif mouseX() >= 368 and mouseX() <= 432 and mouseY() >= 500 and mouseY() <= 564 then
          shots = 0
          hits = 0
          title = 0
          dead = false
          score = 0
          shield = 100
          a2.SW = 100
          a3.SW = 200
          a4.SW = 300
          a5.SW = 400
          cooldown = 20
          love.mouse.setGrabbed(true)
          love.mouse.setVisible(false)
          for i=2, 5 do
            checki(i)
            aT.A = 0
          end
        end
      end
    end -- credit or settings check