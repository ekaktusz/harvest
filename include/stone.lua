function init_stones()
    stones = get_all_coords_for_spriten(44, 2, 2)
end

function draw_stones()
    for stone in all(stones) do
        spr(stone.sprite,stone.x,stone.y,2,2)
    end
end

