function init_trees()
    local trees = {}
    local trees_1 = get_all_coords_for_spriten(128,2,4)
    local trees_2 = get_all_coords_for_spriten(130,2,4)
    local trees_3 = get_all_coords_for_spriten(132,2,4)
    local trees_4 = get_all_coords_for_spriten(134,2,4)
    local trees_5 = get_all_coords_for_spriten(136,2,4)
   
    table_concat(trees,trees_1)
	table_concat(trees,trees_2)
	table_concat(trees,trees_3)
	table_concat(trees,trees_4)
	table_concat(trees,trees_5)

    --trees = array_reverse(trees)

    return trees
end

function draw_trees()
    for tree in all(forest_level.trees) do
        --if (tree.x < cam_x or tree.x > cam_x + 128) or (tree.y < cam.y or tree.y <cam.y+128) then return end
        spr(tree.sprite,tree.x,tree.y,2,4)
    end
    for tree in all(forest_level.eaten_trees) do
        spr(tree.sprite,tree.x,tree.y,2,4)
    end
end

