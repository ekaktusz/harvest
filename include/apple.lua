function init_apples()
    apples = get_all_coords_for_spriten(10)
    eaten_apples = {}
end

function draw_apples()
    for apple in all(apples) do
        spr(apple.sprite,apple.x,apple.y,1,1)
    end
    for apple in all(eaten_apples) do
        spr(apple.sprite,apple.x,apple.y,1,1)
    end
end

function update_apples()
    
end

function bear_collide_with_apple(apple)
    apple_copy = {x=apple.x, y=apple.y, w=apple.w, h=apple.h, sprite=26}
    add(eaten_apples, apple_copy)
    del(apples, apple)
end
