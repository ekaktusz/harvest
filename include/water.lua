function init_water()
    water = get_all_coords_for_spriten(204,2,2)
end

function draw_water()
    for w in all(water) do
        spr(w.sprite,w.x,w.y,2,2)
    end
end