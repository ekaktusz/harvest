local f = 0
local test_a = 0
local test_x = -20

function init_menu()
    _update=update_menu
    _draw = draw_menu
end

function update_menu()
	f+=5
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
    obprint("harvy",37,20,7,0,3)
    wavy_text("press ❎  to start",f)
    rspr(32,test_x,80+sin(0.1*test_x)*14,test_a,4,4)
end