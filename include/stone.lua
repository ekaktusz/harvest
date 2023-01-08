function init_stones()
    local stones = get_all_coords_for_spriten(44, 2, 2)
    return stones
end

function draw_stones()
    for stone in all(forest_level.stones) do
        spr(stone.sprite,stone.x,stone.y,2,2)
    end
end

