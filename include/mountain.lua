function init_mountains()
    mountains = get_all_coords_for_spriten(200, 4, 4)
end

function draw_mountains()
    for m in all(mountains) do
        spr(m.sprite,m.x,m.y,4,4)
    end
end


function bear_collide_with_mountain(mountain)
    bear.eating = true
    --freeze_bear(10)
    shake += 1
    sfx(30)
    del(mountains, mountain)
    bear.num_eaten += 1
end
