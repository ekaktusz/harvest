
-- read all objects with sprite numbers, then remove from map, returns
function get_all_coords_for_spriten(spriten,w,h)
    local _w = w or 1
    local _h = h or 1
    local t = {}
    for i=0,127,1 do
        for j=0,32,1 do
            local sprite_num = mget(i,j)
            if (sprite_num == spriten) then
                local _behind=false

                if mget(i+1,j) == 46 then
                    _behind=true
                end

                obj = {x=i*8,y=j*8,w=_w*8,h=_h*8,sprite=spriten,behind=_behind}

                add(t, obj)
                mset(i,j,14)
            end
        end
    end
    return t
end

function flag_on_tile(x,y,flag)
    local map_x = flr(x/8)
    local map_y = flr(y/8)
    local map_sprite = mget(map_x, map_y)
    return fget(map_sprite)==flag
end

function solid(x,y)
    return flag_on_tile(x,y,1)
end

function solid_on_coord(x,y)
    --for tree in all(trees) do
    --    tree_solid = {x=tree.x, y=tree.y+3*tree.h/4, w=tree.w, h=tree.h/4}
    --    --pset(tree_solid.x,tree_solid.y,8)
    --    --pset(tree_solid.x+tree_solid.w,tree_solid.y+tree_solid.h,8)
    --    --draw_hitbox(tree_solid)
    --    if bear_collide_with_obj(tree_solid) then
    --        return true
    --    end
    --end

    for h in all(hitboxes) do
        if bear_collide_with_obj(h) then
            return true
        end
    end

    cave_solid1 = {x=cave.x,y=cave.y+5, w=cave.w*4/5, h=5}
    cave_solid2 = {x=cave.x,y=cave.y+cave.h-3, w=cave.w*4/5, h=3}
    --draw_hitbox(cave_solid1)
    --draw_hitbox(cave_solid2)
    if bear_collide_with_obj(cave_solid1) then
        return true
    end
    if bear_collide_with_obj(cave_solid2) then
        return true
    end

    --for stone in all(stones) do
    --    --draw_hitbox(stone)
    --    if bear_collide_with_obj(stone) then
    --        return true
    --    end
    --end

    --for w in all(water) do
    --    --draw_hitbox(stone)
    --    if bear_collide_with_obj(w) then
    --        return true
    --    end
    --end

    return false
end

function draw_hitbox(obj)
    rect(obj.x, obj.y, obj.x+obj.w, obj.y+obj.h)
    
    print(obj.x, obj.x, obj.y)
    print(obj.y, obj.x, obj.y+10)
end