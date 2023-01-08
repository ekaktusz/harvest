function init_cave()
    local cave = get_all_coords_for_spriten(192, 4, 4)
    local cave = cave[1]
    return cave
end

function draw_cave_top()
    spr(forest_level.cave.sprite,forest_level.cave.x,forest_level.cave.y,4,4)
end

function draw_cave_bot()
    spr(196,forest_level.cave.x,forest_level.cave.y,4,4)
end

function update_cave()

end