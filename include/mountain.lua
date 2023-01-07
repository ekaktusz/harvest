function init_mountains()
    mountains = get_all_coords_for_spriten(200)
end

function draw_mountains()
    for m in all(mountains) do
        spr(m.sprite,m.x,m.y,4,4)
    end
end