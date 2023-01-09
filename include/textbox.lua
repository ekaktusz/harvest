--- textbox: https://www.lexaloffle.com/bbs/?tid=38668
function tb_init(t) -- this function starts and defines a text box.
    local string = {t.text}
    local _ox = t.x
    local _oy = t.y
    local _w  = t.w
    local _h  = t.h
    local _time = t.time
    local tb={ -- table containing all properties of a text box. i like to work with tables, but you could use global variables if you preffer.
        str=string, -- the strings. remember: this is the table of strings you passed to this function when you called on _update()
        --voice=voice, -- the voice. again, this was passed to this function when you called it on _update()
        i=1, -- index used to tell what string from tb.str to read.
        cur=0, -- buffer used to progressively show characters on the text box.
        char=0, -- current character to be drawn on the text box.
        x=0, -- x coordinate
        y=0, -- y coordginate (106 default)
        ox =_ox or 0,
        oy =_oy or 0,
        w=_w or 127, -- text box width
        h=_h or 21, -- text box height
        col1=0, -- background color
        col2=7, -- border color
        col3=7, -- text color
        time=_time, -- until its dismissed automatically
        reading=true -- sets reading to true when a text box has been called.
    }
    return tb
end

function tb_update(tb)  -- this function handles the text box on every frame update.
    tb.time-=1
    if tb.char<#tb.str[tb.i] then -- if the message has not been processed until it's last character:
        tb.cur+=0.8 -- increase the buffer. 0.5 is already max speed for this setup. if you want messages to show slower, set this to a lower number. this should not be lower than 0.1 and also should not be higher than 0.9
        if tb.cur>0.9 then -- if the buffer is larger than 0.9:
            tb.char+=1 -- set next character to be drawn.
            tb.cur=0    -- reset the buffer.
            --if (ord(tb.str[tb.i],tb.char)!=32) sfx(tb.voice) -- play the voice sound effect.
        end
        if (btnp(5)) tb.char=#tb.str[tb.i] -- advance to the last character, to speed up the message.
    elseif btnp(5) then -- if already on the last message character and button ❎/x is pressed:
        if #tb.str>tb.i then -- if the number of strings to disay is larger than the current index (this means that there's another message to display next):
            tb.i+=1 -- increase the index, to display the next message on tb.str
            tb.cur=0 -- reset the buffer.
            tb.char=0 -- reset the character position.
        else -- if there are no more mesages to display:
            tb.reading=false -- set reading to false. this makes sure the text box isn't drawn on screen and can be used to resume normal gameplay.
        end
    end
    if (tb.time<0) then
        tb.reading=false
    end

    if not bear.eating then
        cam_x = bear.x - 64 + flr(bear.real_w / 2)
        cam_y = bear.y - 64 + flr(bear.real_h / 2)
        cam_x = mid(0,cam_x,896) 
        cam_y = mid(0,cam_y,128) 
    end

    if current_level == "forest" then
        tb.x = cam_x + tb.ox -- x coordinate
        tb.y = cam_y + tb.oy-- y coordginate (106 default)
    else
        tb.x = tb.ox
        tb.y = tb.oy
    end
end

function tb_draw(tb) -- this function draws the text box.
    if tb.reading then -- only draw the text box if reading is true, that is, if a text box has been called and tb_init() has already happened.
        rectfill(tb.x,tb.y,tb.x+tb.w,tb.y+tb.h,tb.col1) -- draw the background.
        rect(tb.x,tb.y,tb.x+tb.w,tb.y+tb.h,tb.col2) -- draw the border.
        print(sub(tb.str[tb.i],1,tb.char),tb.x+2,tb.y+2,tb.col3) -- draw the text.
    end
end

