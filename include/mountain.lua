function init_mountains()
    local mountains = get_all_coords_for_spriten(200)
    return mountains
end

function draw_mountains()
    for m in all(forest_level.mountains) do
        spr(m.sprite,m.x,m.y,4,4)
    end
end