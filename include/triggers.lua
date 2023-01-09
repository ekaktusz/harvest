function init_triggers()
    --textbox triggerek:
    triggers = {}
    add_trigger(80,120,20,100,helps.letsgo_tb)
    add_trigger(190,100,20,100,helps.mallorn_tb)
    add_trigger(180,190,70,15,helps.berry_rb,true) --roadblock
    add_trigger(495,155,75,25,helps.honey_rb,true) --roadblock
end

function add_trigger(_x,_y,_w,_h,_text_box,roadblock)
    local _roadblock = roadblock or false
    --_name = name or ":("
    --textbox: x,y,w,h,text
    local _trigger = {
        x = _x,
        y = _y,
        w = _w,
        h = _h,
        textbox=_text_box,
        roadblock=_roadblock
    }
    add(triggers, _trigger)
end

function bear_collide_with_trigger(t)
    if not tb_1.reading and not t.roadblock then
        tb_1 = tb_init(t.textbox)
    end
    --freeze_bear(80)
    if not t.roadblock then
        del(triggers, t)
    end
end

function delete_roadblocks()
    for t in all(triggers) do
        if t.roadblock then
            del(triggers, t)
        end
    end
end