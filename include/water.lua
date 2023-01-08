function init_water()
    local water = get_all_coords_for_spriten(204,2,2)
    return water
end

function draw_water()
    for w in all(forest_level.water) do
        spr(w.sprite,w.x,w.y,2,2)
    end
end