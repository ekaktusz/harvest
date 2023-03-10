function init_trees()
    trees = {}
    trees_1 = get_all_coords_for_spriten(128,2,4)
    trees_2 = get_all_coords_for_spriten(130,2,4)
    trees_3 = get_all_coords_for_spriten(132,2,4)
    trees_4 = get_all_coords_for_spriten(134,2,4)
    trees_5 = get_all_coords_for_spriten(136,2,4)
   
    table_concat(trees,trees_1)
	table_concat(trees,trees_2)
	table_concat(trees,trees_3)
	table_concat(trees,trees_4)
	table_concat(trees,trees_5)
    --trees = array_reverse(trees)
    eaten_trees = {}
end

function draw_front_trees()
    for tree in all(trees) do
        if not tree.behind then
            spr(tree.sprite,tree.x,tree.y,2,4)
        end
    end
    --for tree in all(eaten_trees) do
    --    spr(tree.sprite,tree.x,tree.y,2,4)
    --end
end

function draw_behind_trees()
    --print(count(trees))
    for tree in all(trees) do
        if tree.behind then
            spr(tree.sprite,tree.x,tree.y,2,4)
        end
    end
    --for tree in all(eaten_trees) do
    --    spr(tree.sprite,tree.x,tree.y,2,4)
    --end
end

function bear_collide_with_tree(tree)
    --bear.eating = true
    --freeze_bear(10)
    shake += 0.05
    sfx(30)
    --explode(bear.x+bear.w/2,bear.y+bear.h/2,bear.w/2,40,100)
    bear.eating = true
    del(trees, tree)
    bear.num_eaten += 1
end
