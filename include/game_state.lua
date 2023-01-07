function init_game()
    _update60 = update_game
    _draw = draw_game
    palt(14, true) -- pink color as transparency is true
    palt(0, false) -- black color as transparency is false
    init_bear()
    init_apples()
    init_trees()
    init_space()
    init_sparks()
    snowing = false
    tb_1 = tb_init({"asdasdasdasdasda"})
end

function update_game()
    update_bear()
    update_apples()
    update_parts(bear_parts)
    
    tb_update(tb_1)
    --r,c=flr(bear.y/8),flr(bear.x/8)
    
    --camera(bear.x-c*8,bear.y-r*8)

    if (bear.level >= 1) then
        snowing = true
    end

    if snowing then
        spawn_snow(1)
        update_snow_parts()
    end

    update_explode()
end

function draw_game()
    cls(0)
    camera_follow_bear()
    map(0,0,0,0,128,32)
    draw_apples()
    draw_parts(bear_parts)
    draw_bear()
    draw_trees()

    if(bear.level >= 1) then
        draw_parts(snow_parts)
    end

    draw_explode()
    tb_draw(tb_1)
    pset(cam_x+64,cam_y+64,8)
end