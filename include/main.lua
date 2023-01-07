function _init()
    init_bear()
    init_apples()
end

function _update()
    update_bear()
    update_apples()
    local r,c=flr(bear.y/8),flr(bear.x/8)
    camera(bear.x-c*8,bear.y-r*8)
end

function _draw()
    cls(0)
    camera_follow_bear()
    map(0,0,0,0,128,32)
    draw_apples()
    draw_bear()
end