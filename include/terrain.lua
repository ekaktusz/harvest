function init_terrain()
    terrain = get_all_coords_for_spriten(14)

    summer_options = {138, 139, 154, 155}
    summer_options_end = {170, 171, 186, 187}
    fall_options = {140, 141, 156, 157}
    fall_options_end = {172, 173, 188, 189}
    winter_options = {174, 175, 190, 191}
    winter_options_end = {142, 143, 158, 159}

    for t in all(terrain) do
        t.sprite = summer_options[ get_rand(1, #summer_options + 1 ) ]
    end
end

function draw_terrain()
    --print(count(terrain), cam_x, cam_y)
    for t in all(terrain) do
        spr(t.sprite,t.x,t.y,1,1)
    end
end