bear_parts = {}
snow_parts = {} 

function addpart(x,y,dx,dy,g,maxage,col,old_col,_parts)
    local p={}
    p.x=x 
    p.y=y 
    p.mage=maxage
    p.age=0
    p.col=col
    p.oldcol=oldcol 
    p.dx=dx
    p.dy=dy
    p.g=g
    add(_parts,p)
end

function spawn_trail(x,y,sx,sy,col,oldcol,intensity,_parts)
    for i=1,intensity,1 do
        local ang = rnd()
        local ox = sin(ang)*sx
        local oy = cos(ang)*sy
        
        addpart(x+ox,y+oy,0,0,0,5+rnd(5),col,oldcol,_parts)
    end
end

function draw_parts(_parts)
    for p in all(_parts) do
        pset(p.x,p.y,p.col)
    end
end

function update_parts(_parts)
    for p in all(_parts) do
        p.dy += p.g
        p.y += p.dy
        p.x += p.dx
        p.age += 1
        if p.age > p.mage then
            del(_parts,p)
        elseif p.age/p.mage > 0.5 then
            p.col = p.oldcol
        end
    end
end

function update_snow_parts()
    for p in all(snow_parts) do
        --p.dy += p.g
        local ang = rnd()
        local ox = sin(ang)*0.5
        p.dx = ox
        p.y += p.g
        p.x += p.dx
        p.age += 1
        if (type(bear) == "table" and p.y > 200) or (type(bear) != "table" and p.y > 128) or (p.age > p.mage) then
            del(snow_parts, p)
        end
    end
end

function spawn_snow(intensitiy)
    local ox = 0
    local oy = 0
    local m = 1
    local mage = 500
    
    if type(bear) == "table" then
        ox = 500
        oy = 200
        m = 10
    end
    
    for i=1,intensitiy*m,1 do
        if (m==10) then 
            mage = get_rand(0,100)
        end
        x = flr(rnd(128+ox))
        y = 0 + rnd(oy)
        addpart(x,y,0,0,0.3 + rnd(0.3),mage,7,7,snow_parts)
    end
end

function clear_snow()
    snow_parts = {}
end