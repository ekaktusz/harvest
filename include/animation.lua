function init_animation(_sprt1, _sprt2, _time)
    local _animation = {
        stp=0,
        sprt1=_sprt1,
        sprt2=_sprt2,
        current_frame=_sprt1,
        time=_time
    }
    return _animation
end

function update_animation(animation)
    animation.stp+=1
    if animation.stp % animation.time == 0 then
        change_frame(animation)
    end
end

function change_frame(animation)
    if animation.current_frame == animation.sprt1 then
        animation.current_frame = animation.sprt2
    else
        animation.current_frame = animation.sprt1
    end
end