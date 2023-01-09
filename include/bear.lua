function init_bear()
    bear = {
        x = cave.x,
        y = cave.y+12,
        dx = 0,
        dy = 0,
        w = 15,
        h = 15,
        real_w = 15,
        real_h = 15,
        spr = 0,
        speed = 1.6,
        num_eaten = 0,
        scale = 0,
        anim = init_animation(0, 16, 10),
        eating_anim = init_animation(0,16,10),
        level = 0,
        angle = 0,
        freezed = false,
        freeze_time = 20,
        freeze_timer = 0,
        eat_time = 40,
        eat_timer = 0,
        rot = 0,
        moving = false,
        eating = false,
        honey_eaten = false,
        seen_barlang = false,
        seen_stone = false
    }
end

function draw_bear()
    --spr(bear.spr, bear.x, bear.y, 2, 2, bear.last_dir==0, false

    if bear.level == 0 then
        --local _tmp = 0
        if not bear.eating then
            sspr(bear.anim.current_frame,16,16,16,bear.x,bear.y,bear.real_w,bear.real_h,bear.last_dir==0,false)
        else
            sspr(bear.eating_anim.current_frame,0,16,16,bear.x,bear.y,bear.real_w,bear.real_h,bear.last_dir==0,false)
        end
    elseif bear.level == 1 then
        if bear.moving then
            sspr(bear.anim.current_frame,32,32,32,bear.x,bear.y,bear.real_w,bear.real_h,bear.last_dir==0,false)
        else
            sspr(96,32,32,32,bear.x,bear.y,bear.real_w,bear.real_h,bear.last_dir==0,false)
        end
    elseif bear.level == 2 then
        --rspr(32,bear.x,bear.y,bear.angle,4,4)
        --draw_rotated_tile(bear.x, bear.y, 0/360,  121, 26, 4,false,1)
        if current_level == "space" then
            pd_rotate(bear.x, bear.y, bear.rot/360,  123, 28, 5,false,1+bear.num_eaten/5)
        else
            pd_rotate(bear.x, bear.y, 0/360,  121, 26, 8,false,1)
        end
    end
end

function update_real_size()
    if bear.level == 0 then
        if bear.num_eaten > 5 and bear.real_w == bear.w then
            bear.real_w=bear.w+1
            bear.real_h=bear.h+1
            tb_1 = tb_init(helps.firstgrow_tb)
        end
        if bear.num_eaten > 8 and bear.real_w == bear.w+1 then
            bear.real_w+=1
            bear.real_h+=1
            tb_1 = tb_init(helps.honey_tb)
        end
        if bear.honey_eaten and bear.real_w == bear.w+2 then
            bear.real_w += 1
            bear.real_h+=1
        end
    elseif bear.level == 1 then
        --bear.real_w=bear.w+bear.num_eaten*2-5
        --bear.real_h=bear.h+bear.num_eaten*2-5
    end
end

function freeze_bear(time)
    bear.freezed = true
    bear.freeze_time = time
    bear.freeze_timer = 0
end

function update_bear()

    bear.moving = false
    bear_collide_with_objs(triggers, bear_collide_with_trigger)

    if tb_1.reading then
        bear.freezed = 0
        bear.freeze_time = 5
    end

    if not tb_1.reading and bear.seen_barlang and not bear.seen_stone then
        tb_1 = tb_init(helps.stones_tb)
        bear.seen_stone=true
    end

    if bear.freezed then
        bear.freeze_timer += 1
        if (bear.freeze_timer > bear.freeze_time) then
            bear.freeze_timer = 0
            bear.freezed = false
        end
        return
    end

    update_animation(bear.eating_anim)

    if bear.eating then
        bear.eat_timer += 1
        if (bear.eat_timer > bear.eat_time) then
            bear.eat_timer = 0
            bear.eating = false
        end
        return
    end
    
    update_real_size()
    update_controls_bear()
    

    if bear.dx != 0 and bear.dy == 0 then
        bear.dx *= sqrt(2)
    end

    if bear.dx == 0 and bear.dy != 0 then
        bear.dy *= sqrt(2)
    end

    if current_level == "forest" then
        if (can_move(bear.x+bear.dx,bear.y,bear.real_w,bear.real_h)) and bear.dx != 0 then
            bear.moving = true
            bear.x+=bear.dx
            spawn_trail(bear.x + bear.real_w/2, bear.y + bear.real_h, 2, 2, 7, 7, 1, bear_parts, 30, 50)
            update_animation(bear.anim)
        end
        if (can_move(bear.x,bear.y+bear.dy,bear.real_w,bear.real_h)) and bear.dy != 0 then
            bear.moving = true
            bear.y+=bear.dy
            spawn_trail(bear.x + bear.real_w/2, bear.y + bear.real_h/2, 2, 2, 7, 7, 1, bear_parts)
            update_animation(bear.anim)
        end
    elseif current_level == "space" then
        bear.x+=bear.dx
        bear.y+=bear.dy
        if bear.dx != 0 or bear.dy != 0 then
            spawn_trail(bear.x + bear.real_w/2, bear.y + bear.real_h/2, bear.real_w/3, bear.real_h/3, 5+rnd(5), 5+rnd(5), 1, bear_parts, 30, 50)
        end
    end

    if count(fishes) == 0 and bear.level == 0 then
        bear.anim.sprt1 = 32
        bear.anim.sprt2 = 64
        bear.anim.current_frame = 32
        bear.h = 31
        bear.w = 31
        bear.real_h = 31
        bear.real_w = 31
        bear.level += 1
        bear.num_eaten = 0
        bear.anim.time = 15
        freeze_bear(10)
        snowing = true
        snow2_init()
        remove_hitbox({x=150,y=240,w=480,h=15})
        explode(bear.x+bear.w/2,bear.y+bear.h/2,bear.w/2,40,100)
        tb_1 = tb_init(helps.jollakot_tb)
    end

    --if bear.num_eaten > 3 and bear.level == 1 then
    --    bear.num_eaten = 0
    --    bear.anim.time = 15
    --    freeze_bear(10)
    --    explode(bear.x+bear.w/2,bear.y+bear.h/2,bear.w/2,100,100)
    --    bear.level += 1
    --end

    bear.dx,bear.dy=0,0
end

function update_controls_bear()
    if current_level == "forest" then
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
            bear_collide_with_objs(foods, bear_collide_with_food)
            bear_collide_with_objs(fishes, bear_collide_with_fish)
        end
        --if btnp(5) then
        --    remove_hitbox({x=150,y=240,w=480,h=15})
        --end
    else
        if btn(⬅️) then 
            bear.rot-=1
        end
        if btn(➡️) then
            bear.rot+=1
        end
        if btn(⬆️) then
            bear.rot+=1
        end
        if btn(⬇️) then 
            bear.rot-=1
        end
    end
end

function camera_follow_bear()
    cam_x = bear.x - 64 + flr(bear.real_w / 2)
    cam_y = bear.y - 64 + flr(bear.real_h / 2)

    if cam_x > (map_size_x - 128) then
        print("hellooo")
        cam_x = map_size_x - 128
    else
        cam_x = mid(0,cam_x,map_size_x) 

    end

    --log("CAM")
    --log(cam_y)
    --log(map_size_y - 64 + flr(bear.real_h / 2))
    if cam_y > (map_size_y - 128) then
        log("aAA")
        cam_y = map_size_y - 128
    else
        cam_y = mid(0,cam_y,map_size_y) 

    end

    camera(cam_x, cam_y)
end

function can_move(x, y, w, h)
    --pset(x,y,8)
    --pset(x+w,y,8)
    --pset(x,y+h,8)
    --pset(x+w,y+h,8)

    if (x < 0 or x+w > map_size_x or y < 0 or y+h > map_size_y) return false

    if (solid(x,y) or solid_on_coord(x,y)) return false
    if (solid(x+w,y) or solid_on_coord(x+w,y)) return false
    if (solid(x,y+h)or solid_on_coord(x,y+h)) return false
    if (solid(x+w,y+h) or solid_on_coord(x+w,y+h)) return false

	return true
end
