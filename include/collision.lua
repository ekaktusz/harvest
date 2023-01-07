function bear_collide_with_obj(obj)
    local bx1 = bear.x
    local bx2 = bear.x + bear.w
    local by1 = bear.y
    local by2 = bear.y + bear.h
    local ox1 = obj.x
    local ox2 = obj.x + obj.w
    local oy1 = obj.y
    local oy2 = obj.y + obj.h

    if (ox1 < bx2 and ox1 > bx1 and oy1 > by1 and oy1 < by2) then
        return true
    end

    if ox2 < bx2 and ox2 > bx1 and oy2 > by1 and oy2 < by2 then
        return true
    end

    if ox1 < bx2 and ox1 > bx1 and oy2 > by1 and oy2 < by2 then
        return true
    end

    if ox2 < bx2 and ox2 > bx1 and oy1 > by1 and oy1 < by2 then
        return true
    end

    return false
end

function bear_collide_with_objs(objects, what_to_do)
    for obj in all(objects) do
        if bear_collide_with_obj(obj) then
            what_to_do(obj)
        end
    end
end