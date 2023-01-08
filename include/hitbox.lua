function init_hitboxes()
    hitboxes = {}
    add_hitbox(50,50,50,50)
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