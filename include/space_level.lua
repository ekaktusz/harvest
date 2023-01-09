function init_space_level()
    space = {
        background_stars = init_stars(),
        planets = init_planets(),
        anim_time = 60,
        anim_timer = 0
    }
    current_level = "space"
    bear.level = 2
    finished = false
    shake = 0
    
    sstar_init()
end

function init_stars()
    local stars = {}
    for i=1,10000,1 do
        star = {
            x = get_rand(-1000,1000),
            y = get_rand(-1000,1000),
        }
        if rnd(1) < 0.5 then
            star.c = 5
        else
            star.c = 6
        end
        add(stars, star)
    end
    return stars
end

function init_planets()
    --local planet_options = {40,41,56,57,47,62,63}
    local planet_options = {{sx=64,sy=16},{sx=64,sy=24},{sx=72,sy=16},{sx=72,sy=24},{sx=120,sy=16},{sx=120,sy=24},{sx=112,sy=24}}
    local planets = {}
    for i=1,300,1 do
        planet = {
            x = get_rand(-1000,1000),
            y = get_rand(-1000,1000),
            r = get_rand(4,8)
        }
        --planet.c = 1 + rnd(14)
        planet.sprt = planet_options[ get_rand(1, #planet_options + 1 ) ]
        add(planets, planet)
    end
    return planets
end

function draw_space_level()
    cls(0)

    --camera_follow_bear()
    --for star in all(space.background_stars) do
    --    pset(star.x,star.y,star.c)
    --end
    
    sstar_draw()

    if not finished then
        draw_parts(bear_parts)
        draw_bear()
    end

    if finished and space.anim_time < 20 then
        draw_constellation()
    end

    if not finished then
        for planet in all(space.planets) do
            --circfill(planet.x, planet.y, planet.r, planet.c)
            sspr(planet.sprt.sx,planet.sprt.sy,8,8,planet.x-planet.r,planet.y-planet.r,planet.r*2,planet.r*2)
            --circfill(planet.x+1, planet.y+1, planet.r-2, planet.c+1)
        end
    end
    --log(current_level)

    draw_explode()
    doshake()
end

function update_space_level()
    --update_bear()
    --update_parts(bear_parts)
    
    if not finished then
        update_controls_bear()
        sstar_update()
    end

    update_explode(0.1)

    if bear.num_eaten >= 5 and space.anim_time >0  then
        finished = true
        explode(63,63,bear.w,500,300)
        shake+=0.02
        space.anim_time -= 1
    end
end