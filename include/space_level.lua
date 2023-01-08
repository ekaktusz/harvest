function init_space_level()
    space = {
        background_stars = init_stars(),
        planets = init_planets()
    }
    current_level = "space"
    bear.level = 2
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
    local planets = {}
    for i=1,300,1 do
        planet = {
            x = get_rand(-1000,1000),
            y = get_rand(-1000,1000),
            r = get_rand(2,5)
        }
        planet.c = 1 + rnd(14)
        add(planets, planet)
    end
    return planets
end

function draw_space_level()
    cls(0)
    camera_follow_bear()
    for star in all(space.background_stars) do
        pset(star.x,star.y,star.c)
    end
    for planet in all(space.planets) do
        circfill(planet.x, planet.y, planet.r, planet.c)
        --circfill(planet.x+1, planet.y+1, planet.r-2, planet.c+1)
    end

    draw_parts(bear_parts)
    draw_bear()

    
    sstar_draw()
    --log(current_level)
end

function update_space_level()
    --update_bear()
    --update_parts(bear_parts)
    update_controls_bear()
    sstar_update()
end

