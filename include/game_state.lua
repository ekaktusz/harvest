function init_game()
    _update60 = update_game
    _draw = draw_game
    palt(14, true) -- pink color as transparency is true
    palt(0, false) -- black color as transparency is false
    forest_level = init_forest_level()
    init_bear()
    init_sparks()
    tb_1 = tb_init({"asdasdasdasdasda"})
end

function update_game()
    update_bear()
    tb_update(tb_1)
    update_parts(bear_parts)

    update_forest_level()

    update_explode()
end

function draw_game()
    cls(0)
    camera_follow_bear()
    map(0,0,0,0,128,32)
    
    draw_forest_level()

    draw_explode()
    tb_draw(tb_1)
    pset(cam_x+64,cam_y+64,8)
    print(stat(1),cam_x,cam_y)
end