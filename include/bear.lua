function init_bear()
    bear = {
        x = 100,
        y = 128,
        dx = 0,
        dy = 0,
        w = 15,
        h = 15,
        spr = 0,
        speed = 1.2,
        num_eaten = 0,
        anim = init_animation(0, 11, 7),
        level = 0
    }
end

function draw_bear()
    --spr(bear.spr, bear.x, bear.y, 2, 2, bear.last_dir==0, false)
    print(bear.anim.current_frame)
    if bear.level == 0 then
        sspr(bear.anim.current_frame*8,0,16,16,bear.x,bear.y,bear.w+bear.num_eaten,bear.h+bear.num_eaten,bear.last_dir==0,false)
    elseif bear.level == 1 then
        sspr(bear.anim.current_frame,32,32,32,bear.x,bear.y,bear.w+bear.num_eaten*2-5,bear.h+bear.num_eaten*2-5,bear.last_dir==0,false)
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

    if (can_move(bear.x+bear.dx,bear.y,bear.w,bear.h)) and bear.dx != 0 then
        bear.x+=bear.dx
        spawn_trail(bear.x + bear.w/2, bear.y + bear.h/2, 2, 2, 7, 7, 1, bear_parts)
        update_animation(bear.anim)
    end
    if (can_move(bear.x,bear.y+bear.dy,bear.w,bear.h)) and bear.dy != 0 then
        bear.y+=bear.dy
        spawn_trail(bear.x + bear.w/2, bear.y + bear.h/2, 2, 2, 7, 7, 1, bear_parts)
        update_animation(bear.anim)
    end

    if bear.num_eaten > 3 and bear.level == 0 then
        bear.anim.sprt1 = 32
        bear.anim.sprt2 = 64
        bear.anim.current_frame = 32
        bear.h = 31
        bear.w = 31
        bear.level += 1
        bear.num_eaten = 0
        bear.anim.time = 15
    end

    bear.dx,bear.dy=0,0
end

function update_controls_bear()
    if btn(⬅️) then 
        bear.dx-=bear.speed
        bear.last_dir = 0
    end
	if btn(⬆️) then 
        bear.dy-=bear.speed
    end
	if btn(➡️) then 
        bear.dx+=bear.speed
        bear.last_dir = 1
    end
	if btn(⬇️) then 
        bear.dy+=bear.speed
    end
    if btnp(4) then
        bear_collide_with_objs(apples, bear_collide_with_apple)
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
    if (solid(x,y) or solid_on_coord(x,y)) return false
    if (solid(x+w,y) or solid_on_coord(x+w,y)) return false
    if (solid(x,y+h)or solid_on_coord(x,y+h)) return false
    if (solid(x+w,y+h) or solid_on_coord(x+w,y+h)) return false
	return true
end