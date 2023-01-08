function init_water()
    water = get_all_coords_for_spriten(204,2,2)
    water_anim = init_animation(204,206, 30)
    for s in all(splashes) do
        add(water,{x=s.x, y=s.y, w=s.w, h=s.h, sprite=204})
    end
end

function draw_water()
    for w in all(water) do
        spr(water_anim.current_frame,w.x,w.y,2,2)
    end
end