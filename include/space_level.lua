function init_space()
    space = {
        background_stars = init_stars()
    }
end

function init_stars()
    local stars = {}
    for i=1,10000,1 do
        star = {
            x = get_rand(-1000,1000),
            y = get_rand(-1000,1000)
        }
        add(stars, star)
    end
    return stars
end

function draw_space()
    cls(0)
    for star in all(space.background_stars) do
        pset(star.x,star.y,7)
    end
end