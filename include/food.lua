function init_foods()
    local foods = {}
    local eaten_foods = {}
    local apples = get_all_coords_for_spriten(42)
    local purpls = get_all_coords_for_spriten(43)
    local purpls2 = get_all_coords_for_spriten(58)
    local pears = get_all_coords_for_spriten(59)
    local honeys = get_all_coords_for_spriten(4,2,2)
    local berrys = get_all_coords_for_spriten(36,2,2)
    local melons = get_all_coords_for_spriten(40,2,2)

    table_concat(foods,apples)
    table_concat(foods,purpls)
    table_concat(foods,purpls2)
    table_concat(foods,pears)
    table_concat(foods,honeys)
    table_concat(foods,berrys)
    table_concat(foods,melons)

    return foods
end

function draw_foods()
    for food in all(forest_level.foods) do
        spr(food.sprite,food.x,food.y,food.w/8,food.h/8)
    end
    for food in all(forest_level.eaten_foods) do
        spr(food.sprite,food.x,food.y,food.w/8,food.h/8)
    end
end

function bear_collide_with_food(food)
    food_copy = {x=food.x, y=food.y, w=food.w, h=food.h, sprite=14}
    add(forest_level.eaten_foods, food_copy)
    del(forest_level.foods, food)
    bear.num_eaten += 1
end
