function init_foods()
    foods = {}
    eaten_foods = {}
    apples = get_all_coords_for_spriten(42)
    purpls = get_all_coords_for_spriten(43)
    purpls2 = get_all_coords_for_spriten(58)
    pears = get_all_coords_for_spriten(59)
    honeys = get_all_coords_for_spriten(4,2,2)
    berrys = get_all_coords_for_spriten(36,2,2)
    melons = get_all_coords_for_spriten(40,2,2)

    honey_anim = init_animation(4,6,18)

    table_concat(foods,apples)
    table_concat(foods,purpls)
    table_concat(foods,purpls2)
    table_concat(foods,pears)
    table_concat(foods,honeys)
    table_concat(foods,berrys)
    table_concat(foods,melons)
end

function draw_foods()
    for food in all(foods) do
        if food.sprite == 4 then --honey
            spr(honey_anim.current_frame,food.x,food.y,food.w/8,food.h/8)
        else
            spr(food.sprite,food.x,food.y,food.w/8,food.h/8)
        end
    end
    for food in all(eaten_foods) do
        if food.sprite == 4 then --honey
            spr(8,food.x,food.y,food.w/8,food.h/8)
        elseif food.sprite == 36 then
            spr(38,food.x,food.y,food.w/8,food.h/8)
        else
            spr(14,food.x,food.y,food.w/8,food.h/8)
        end
    end
end

function update_foods()
    update_animation(honey_anim)
end

function bear_collide_with_food(food)
    food_copy = {x=food.x, y=food.y, w=food.w, h=food.h, sprite=food.sprite}
    bear.eating = true
    --freeze_bear(10)
    add(eaten_foods, food_copy)
    del(foods, food)
    bear.num_eaten += 1
end
