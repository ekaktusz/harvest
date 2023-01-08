function init_fishes()
    fishes = {}
    local piros_fish = get_all_coords_for_spriten(12,2,2)
    local szurke_fish = get_all_coords_for_spriten(10,2,2)
    add(fishes,piros_fish[1])
    add(fishes,szurke_fish[1])
    add(fishes,piros_fish[2])
    splashes = get_all_coords_for_spriten(236,2,2)
    splash_anim = init_animation(236, 14, 70)
    fish_anim1 = init_animation(10, 14, 70)
    fish_anim2 = init_animation(12, 14, 70)
end

function draw_fishes()
    for f in all(fishes) do
        if (f.sprite == 10) then
            spr(fish_anim1.current_frame,f.x,f.y,2,2)
        end
        if (f.sprite == 12) then
            spr(fish_anim2.current_frame,f.x,f.y,2,2)
        end
    end
    for s in all(splashes) do
        spr(splash_anim.current_frame,s.x,s.y,2,2)
    end
end

function bear_collide_with_fish(fish)
    --food_copy = {x=food.x, y=food.y, w=food.w, h=food.h, sprite=food.sprite}
    if fish_anim1.current_frame == 14 then
        return
    end
    bear.num_eaten += 1
    for i=1,#fishes,1 do
        if fishes[i] == fish then
            del(fishes, fishes[i])
            del(splashes, splashes[i])
            return
        end
    end
end

function update_fishes()
    update_animation(splash_anim)
    update_animation(fish_anim1)
    update_animation(fish_anim2)
end