function get_all_coords_for_spriten(spriten)
    local t = {}
    for i=1,127,1 do
        for j=1,32,1 do
            local sprite_num = mget(i,j)
            if (sprite_num == spriten) then
                add(t, {i*8,j*8,spriten})
            end
        end
    end
    return t
end

function set_tile_to(x,y,spriten)
    local map_x = flr(x/8)
    local map_y = flr(y/8)
    mset(map_x,map_y,spriten)
end