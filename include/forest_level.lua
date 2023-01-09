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
    init_fishes()
    init_water()
    init_hitboxes()
    init_triggers()
    snowing = false
    tb_1 = tb_init(helps.start_tb)

    map_size_x = 800
    map_size_y = 255

    shake = 0

    season_color = 3
    current_season = "summer"
    current_level = "forest"
    
    time = 0
end

function update_forest_level()
    time+=1
    update_bear()
    update_parts(bear_parts)
    update_animation(water_anim)
    update_foods()
    update_fishes()
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

    if btnp(5) then
        --switch_season()
    end

    doshake()
end

function draw_forest_level()
    cls(0)
    camera_follow_bear()
    map(0,0,0,0,128,32)
    rectfill(0,60,map_size_x,map_size_y,season_color) --ground
    rectfill(0,0,map_size_x,60,1) --sky
    draw_terrain()
    draw_water()
    draw_foods()
    draw_parts(bear_parts)
    draw_cave_bot()
    draw_behind_trees()
    draw_bear()
    draw_cave_top()
    draw_mountains()
    draw_front_trees()
    draw_stones()
    draw_fishes()
    
    if(bear.level >= 1) then
        --draw_parts(snow_parts)
        snow2_draw()
    end

    draw_explode()
    tb_draw(tb_1)

    pset(cam_x+64,cam_y+64,8)

    --draw_hitboxes()

    --(1),cam_x,cam_y)
end

function switch_season()
    if current_season == "summer" then

    end
    season_color=9
    for t in all(terrain) do
        t.season_tile_num = get_rand(1, 5)
        t.sprite = fall_options[t.season_tile_num]
    end
    for t in all(trees) do 
        if t.sprite == 132 then
            local _tmp = rnd(1)
            if _tmp < 0.5 then
                t.sprite = 136
            end
        end
    end
end