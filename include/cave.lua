function init_cave()
    cave = get_all_coords_for_spriten(192, 4, 4)
    cave = cave[1]
end

function draw_cave_top()
    spr(cave.sprite,cave.x,cave.y,4,4)
end

function draw_cave_bot()
    spr(196,cave.x,cave.y,4,4)
end

function update_cave()

end