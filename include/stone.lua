function init_stones() 
    stones = get_all_coords_for_spriten(44, 2, 2)
    tree_log = get_all_coords_for_spriten(46, 2, 2)
    --table_concat(stones,tree_log)
end

function draw_stones()
    for stone in all(stones) do
        spr(stone.sprite,stone.x,stone.y,2,2)
    end
end

function bear_collide_with_stone(stone)
    --bear.eating = true
    --freeze_bear(10)
    del(stones, stone)
    bear.num_eaten += 1
end
