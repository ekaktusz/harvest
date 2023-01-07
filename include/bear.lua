function init_bear()
    bear = {
        x = 0,
        y = 0,
        dx = 0,
        dy = 0,
        w = 15,
        h = 15,
        spr = 0
    }
end

function draw_bear()
    spr(bear.spr, bear.x, bear.y, 2, 2, bear.last_dir==0, false)

    if is_bear_on_flag(2) then
        print('on')
    end
end

function update_bear()
    update_controls_bear()

    if bear.dx != 0 and bear.dy == 0 then
        bear.dx *= sqrt(2)
    end

    if bear.dx == 0 and bear.dy != 0 then
        bear.dy *= sqrt(2)
    end

    if (can_move(bear.x+bear.dx,bear.y,bear.w,bear.h)) then
        bear.x+=bear.dx
    end
    if (can_move(bear.x,bear.y+bear.dy,bear.w,bear.h)) then
        bear.y+=bear.dy
    end

    bear.dx,bear.dy=0,0
end

function update_controls_bear()
    if btn(⬅️) then 
        bear.dx-=1
        bear.last_dir = 0
    end
	if btn(⬆️) then 
        bear.dy-=1 
    end
	if btn(➡️) then 
        bear.dx+=1 
        bear.last_dir = 1
    end
	if btn(⬇️) then 
        bear.dy+=1 
    end
    if btnp(4) then
        if is_bear_on_flag(2) then
            set_tile_to(bear.x,bear.y,26)
        end 
    end
end

function camera_follow_bear()
    local cam_x = bear.x-60
    local cam_y = bear.y-60
    cam_x = mid(0,cam_x,896)
    cam_y = mid(0,cam_y,128)
    camera(cam_x, cam_y)
end

function can_move(x, y, w, h)
    if (solid(x,y)) return false
    if (solid(x+w,y)) return false
    if (solid(x,y+h)) return false
    if (solid(x+w,y+h)) return false
	return true
end

function is_bear_on_flag(flag)
    if (flag_on_tile(bear.x,bear.y,flag)) return true
    if (flag_on_tile(bear.x+bear.w,bear.y,flag)) return true
    if (flag_on_tile(bear.x,bear.y+bear.h,flag)) return true
    if (flag_on_tile(bear.x+bear.w,bear.y+bear.h,flag)) return true
    if (flag_on_tile(bear.x+bear.w/2,bear.y+bear.h/2,flag)) return true
	return false
end

function solid(x,y)
    return flag_on_tile(x,y,1)
end

function flag_on_tile(x,y,flag)
    local map_x = flr(x/8)
    local map_y = flr(y/8)
    local map_sprite = mget(map_x, map_y)
    return fget(map_sprite)==flag
end

