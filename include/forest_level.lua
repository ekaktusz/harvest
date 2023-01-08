function init_forest_level()
    local forest_level = {
        water = init_water(), --done
        trees = init_trees(), --done
        eaten_trees = {}, --done 
        stones = init_stones(), --done
        terrain = init_terrain(), --done
        mountains = init_mountains(), --done
        foods = init_foods(), --done
        eaten_foods = {}, --done
        cave = init_cave(), --done
        snowing = false
    }
    return forest_level
end

function update_forest_level()
    if (bear.level >= 1) then
        snowing = true
    end

    if snowing then
        spawn_snow(1)
        update_snow_parts()
    end
end

function draw_forest_level()
    map(0,0,0,0,128,32)
    draw_terrain()
    draw_water()
    draw_foods()
    draw_parts(bear_parts)
    draw_cave_bot()
    draw_bear()
    draw_cave_top()
    draw_mountains()
    draw_trees()
    draw_stones()
    
    if(bear.level >= 1) then
        draw_parts(snow_parts)
    end
end