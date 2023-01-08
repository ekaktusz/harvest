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
            mage = get_rand(20,60)
        end
        x = flr(rnd(128+ox))
        y = 0 + rnd(oy)
        addpart(x,y,0,0,0.3 + rnd(0.3),mage,7,7,snow_parts)
    end
end

function clear_snow()
    snow_parts = {}
end

function init_sparks()
    sparks={}

    for i=1,200 do
        add(sparks,{
            x=0,y=0,velx=0,
            vely=0,r=0,alive=false,mass=0
        })
    end
end

function explode(x,y,r,particles)
	--creates a exposion particle emitter
	--x,y: emitter location
	--r:maximum particle radius
	--particles: particles to be spanwned
	local selected=0//count current spawned particles
	for i=1,#sparks do
		if not sparks[i].alive then	-- check if spakrs{} table has any empty particle slots		
			--setup each particle's property
			sparks[i].x=x
			sparks[i].y=y
			sparks[i].velx= -1+rnd(2)
			sparks[i].vely= -1+rnd(2)
			sparks[i].mass= 0.5+rnd(2)
			sparks[i].r= 0.5+rnd(r)
			sparks[i].alive=true
			selected+=1
			if selected==particles then
				break end
		end
	end
end

function update_explode()
	for i=1,#sparks do
		if sparks[i].alive then
			sparks[i].x+=sparks[i].velx / sparks[i].mass
			sparks[i].y+=sparks[i].vely / sparks[i].mass
			sparks[i].r-=0.4
			if sparks[i].r<0.1then--kill particle when too small
				sparks[i].alive=false
			end
		end
	end
end

function draw_explode()
    for i=1, #sparks do
		if sparks[i].alive then
			circfill(
                sparks[i].x, --x pos
                sparks[i].y, --y pos
                sparks[i].r, --radius
                --5+rnd(5) --color
                7
			)
	    end
	end
end
