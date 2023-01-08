function init_hitboxes()
    hitboxes = {}
    add_hitbox(0,0,180,120)
    add_hitbox(150,170,30,80)
    add_hitbox(250,145,40,50)
    add_hitbox(270,0,400,90)
    add_hitbox(170,0,100,75)
    add_hitbox(0,170,50,150)
    add_hitbox(150,240,480,15)
    add_hitbox(50,220,150,100)
    add_hitbox(285,135,210,60)
    add_hitbox(570,120,30,80)
    add_hitbox(610,210,30,50)
    add_hitbox(650,0,150,133)
    add_hitbox(680,150,50,53)
end

function add_hitbox(_x,_y,_w,_h)
    local _hitbox = {
        x = _x,
        y = _y,
        w = _w,
        h = _h
    }
    add(hitboxes, _hitbox)
end

function draw_hitboxes()
    print(count(hitboxes), cam_x, cam_y)
    for h in all(hitboxes) do
        draw_hitbox(h)
    end
end