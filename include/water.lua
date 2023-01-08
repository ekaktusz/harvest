function init_water()
    water = get_all_coords_for_spriten(204,2,2)
    water_anim = init_animation(204,206, 30)
end

function draw_water()
    for w in all(water) do
        spr(water_anim.current_frame,w.x,w.y,2,2)
    end
end