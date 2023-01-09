local f = 0
local test_a = 0
local test_x = 0

function init_menu()
    _update60=update_menu
    _draw = draw_menu
    anim_size = 95
    x_pressed = false
    music(32)
end

function update_menu()
	f+=2.5
    if btnp(5) then
        --init_game()
        --clear_snow()
        sfx(35)
        x_pressed = true
    end

    if btn(1) then
        test_a += 3
    end

    if btn(0) then
        test_a -= 3
    end

    spawn_snow(1)
    update_snow_parts()

    test_x += .1

    if test_x > 145 then
        test_x = -20
    end
    
    if x_pressed then
        anim_size -= 3
    end

    if anim_size < -1 then
        init_game()
        clear_snow()
    end
end

function draw_menu()
	cls(1)
    draw_parts(snow_parts)
    obprint("ursa maior",16,20,7,0,2.5)
    wavy_text("press ❎  to start",f)
    --rspr(32,test_x,80+sin(0.1*test_x)*14,test_a,4,4)
    palt(14, true) -- pink color as transparency is true
    palt(0, false) -- black color as transparency is false
    pd_rotate(test_x, 100+sin(0.05*test_x)*14, test_a/360, 123, 28, 5, false, 1)
    --print(test_x)
    draw_anim(anim_size)
end