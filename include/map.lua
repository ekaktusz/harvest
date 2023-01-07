
-- read all objects with sprite numbers, then remove from map, returns
function get_all_coords_for_spriten(spriten)
    local t = {}
    for i=1,127,1 do
        for j=1,32,1 do
            local sprite_num = mget(i,j)
            if (sprite_num == spriten) then
                add(t, {x=i*8,y=j*8,w=8,h=8,sprite=spriten})
                mset(i,j,2)
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

