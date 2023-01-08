function init_game()
    _update60 = update_game
    _draw = draw_game
    init_forest_level()
end

function update_game()
    if current_level == "forest" then
        update_forest_level()
    elseif current_level == "space" then
        update_space_level()
    end
end

function draw_game()
    if current_level == "forest" then
        draw_forest_level()
    elseif current_level == "space" then
        draw_space_level()
    end
end


function switch_to_space_level()
    clear_table(cave)
    clear_table(foods)
    clear_table(trees)
    snowing = false
    clear_table(terrain)
    clear_table(mountains)
    clear_table(stones)  
    clear_table(water)
    init_space_level()
end