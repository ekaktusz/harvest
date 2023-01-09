function init_triggers()
    --textbox triggerek:
    triggers = {}
    add_trigger(80,120,20,100,helps.letsgo_tb)
    add_trigger(190,100,20,100,helps.mallorn_tb)
end

function add_trigger(_x,_y,_w,_h,_text_box)
    --textbox: x,y,w,h,text
    local _trigger = {
        x = _x,
        y = _y,
        w = _w,
        h = _h,
        textbox=_text_box
    }
    add(triggers, _trigger)
end

function bear_collide_with_trigger(t)
    tb_1 = tb_init({t.textbox.text},t.textbox.x,t.textbox.y,t.textbox.w,t.textbox.h)
    freeze_bear(80)
    del(triggers, t)
end