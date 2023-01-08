function init_forest_level()
    palt(14, true) -- pink color as transparency is true
    palt(0, false) -- black color as transparency is false
    init_terrain()
    init_cave()
    init_bear()
    init_foods()
    init_trees()
    init_sparks()
    init_mountains()
    init_stones()
    init_water()
    init_hitboxes()
    snowing = false
    tb_1 = tb_init({"asdasdasdasdasda"})

    map_size_x = 800
    map_size_y = 255
    
    current_level = "forest"
end

function update_forest_level()
    update_bear()
    update_parts(bear_parts)
    update_animation(water_anim)
    update_foods()
    tb_update(tb_1)
    --r,c=flr(bear.y/8),flr(bear.x/8)
    
    --camera(bear.x-c*8,bear.y-r*8)

    if snowing then
        snow2_update()
        --spawn_snow(1)
        --update_snow_parts()
    end

    update_explode()

    if bear.level >=2 and bear.num_eaten >= 2 then
        bear.num_eaten = 0
        switch_to_space_level()
    end
end

function draw_forest_level()
    cls(0)
    camera_follow_bear()
    map(0,0,0,0,128,32)
    rectfill(0,0,map_size_x,60,1) --sky
    draw_terrain()
    draw_water()
    draw_foods()
    draw_parts(bear_parts)
    draw_cave_bot()
    draw_bear()
    draw_cave_top()
    draw_mountains()
    draw_trees()
    draw_stones()
    
    if(bear.level >= 1) then
        --draw_parts(snow_parts)
        snow2_draw()
    end

    

    draw_explode()
    tb_draw(tb_1)

    pset(cam_x+64,cam_y+64,8)

    draw_hitboxes()
end