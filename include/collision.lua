function bear_collide_with_obj(obj)
    local bx1 = bear.x + bear.dx
    local bx2 = bear.x + bear.dx + bear.real_w
    local by1 = bear.y + bear.dy
    local by2 = bear.y + bear.dy + bear.real_h
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

    if (bx1 < ox2 and bx1 > ox1 and by1 > oy1 and by1 < oy2) then
        return true
    end
    
    if bx2 < ox2 and bx2 > ox1 and by2 > oy1 and by2 < oy2 then
        return true
    end
    
    if bx1 < ox2 and bx1 > ox1 and by2 > oy1 and by2 < oy2 then
        return true
    end
    
    if bx2 < ox2 and bx2 > ox1 and by1 > oy1 and by1 < oy2 then
        return true
    end

    --cx = abs((bx1+bx2)/2-ox1)

    return false
end

function bear_collide_with_objs(objects, what_to_do)
    for obj in all(objects) do
        if bear_collide_with_obj(obj) then
            what_to_do(obj)
        end
    end
end