local f = 0
local test_a = 0
local test_x = -20

function init_menu()
    _update60=update_menu
    _draw = draw_menu
    
end

function update_menu()
	f+=2.5
    if btnp(5) then
        init_game()
        clear_snow()
    end

    if btn(1) then
        test_a += 3
    end

    if btn(0) then
        test_a -= 3
    end

    spawn_snow(1)
    update_snow_parts()

    test_x += 0.1
end

function draw_menu()
	cls(1)
    draw_parts(snow_parts)
    obprint("ursa major",16,20,7,0,2.5)
    wavy_text("press ❎  to start",f)
    --rspr(32,test_x,80+sin(0.1*test_x)*14,test_a,4,4)
    palt(14, true) -- pink color as transparency is true
    palt(0, false) -- black color as transparency is false
    pd_rotate(test_x, 100+sin(0.05*test_x)*14, test_a/360, 123, 28, 5, false, 1)
    print(stat(1))
end