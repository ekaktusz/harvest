--wavy text
function wavy_text(text,f)
	local y
 local c
 local x = 128/2 - (#text*4)/2
 for c=1,#text do
 	y = sin((x+f)/100) * 2
  color(5)
  print(sub(text,c,c),x,(64-4)+y)
  y = sin((x+10+f)/100) * 2
  color(7)
  print(sub(text,c,c),x,(64-4)+y)
  x = x+4
 end
end

function obprint(str,x,y,c,co,scale)
	_str_to_sprite_sheet(str)
	
	local w = #str*4
	local h = 5
	palt(0,true)
	
	pal(7,co)
	
	
	for xx=-2,1,2 do
		for yy=-2,1,2 do
			sspr(0,0,w,h,x+xx,y+yy,w*scale,h*scale)
		end
	end
	
	pal(7,c)
	sspr(0,0,w,h,x,y,w*scale,h*scale)
	pal()
	
	_restore_sprites_from_usermem()
end

function _str_to_sprite_sheet(str)
	_copy_sprites_to_usermem()
	_black_out_sprite_row()
	set_sprite_target()
	print(str,0,0,7)
	set_screen_target()
end

function set_sprite_target()
	poke(0x5f55,0x00)
end

function set_screen_target()
	poke(0x5f55,0x60)
end

function _copy_sprites_to_usermem()
	memcpy(0x4300,0x0,0x0200)
end

function _black_out_sprite_row()
	memset(0x0,0,0x0200)
end

function _restore_sprites_from_usermem()
	memcpy(0x0,0x4300,0x0200)
end

function doshake()
	-- this function does the
	-- shaking
	-- first we generate two
	-- random numbers between
	-- -16 and +16
	local shakex=16-rnd(32)
	local shakey=16-rnd(32)

	-- then we apply the shake
	-- strength
	shakex*=shake
	shakey*=shake

	-- then we move the camera
	-- this means that everything
	-- you draw on the screen
	-- afterwards will be shifted
	-- by that many pixels
	camera(shakex,shakey)

	-- finally, fade out the shake
	-- reset to 0 when very low
	shake = shake*0.95
	if (shake<0.05) shake=0
	end

	function fadepal(_perc)
	-- this function sets the
	-- color palette so everything
	-- you draw afterwards will
	-- appear darker
	-- it accepts a number from
	-- 0 means normal
	-- 1 is completely black
	-- this function has been
	-- adapted from the jelpi.p8
	-- demo

	-- first we take our argument
	-- and turn it into a 
	-- percentage number (0-100)
	-- also making sure its not
	-- out of bounds  
	local p=flr(mid(0,_perc,1)*100)

	-- these are helper variables
	local kmax,col,dpal,j,k

	-- this is a table to do the
	-- palette shifiting. it tells
	-- what number changes into
	-- what when it gets darker
	-- so number 
	-- 15 becomes 14
	-- 14 becomes 13
	-- 13 becomes 1
	-- 12 becomes 3
	-- etc...
	dpal={0,1,1, 2,1,13,6,
			4,4,9,3, 13,1,13,14}

	-- now we go trough all colors
	for j=1,15 do
	--grab the current color
	col = j

	--now calculate how many
	--times we want to fade the
	--color.
	--this is a messy formula
	--and not exact science.
	--but basically when kmax
	--reaches 5 every color gets 
	--turns black.
	kmax=(p+(j*1.46))/22

	--now we send the color 
	--through our table kmax
	--times to derive the final
	--color
	for k=1,kmax do
		col=dpal[col]
	end

	--finally, we change the
	--palette
	pal(j,col)
	end
end

--rotating sprite
function rspr(s,x,y,a,w,h)
    sw=(w or 1)*8
    sh=(h or 1)*8
    sx=(s%8)*8
    sy=flr(s/8)*8
    x0=flr(0.5*sw)
    y0=flr(0.5*sh)
    a=a/360
    sa=sin(a)
    ca=cos(a)
    for ix=sw*-1,sw+4 do
     for iy=sh*-1,sh+4 do
      dx=ix-x0
      dy=iy-y0
      xx=flr(dx*ca-dy*sa+x0)
      yy=flr(dx*sa+dy*ca+y0)
      if (xx>=0 and xx<sw and yy>=0 and yy<=sh-1) then
       local col = sget(sx+xx,sy+yy)
           if col != 14 then
               pset(x+ix,y+iy,col)
           end
      end
     end
    end
   end

function get_rand(min,max)
    return min + flr(rnd(max - min))
end

function get_rand_f(min,max)
    return min + rnd(max - min)
end

function table_concat(t1,t2) --feltetelezzuk hogy object
    for i=1,#t2 do
        t1[#t1+1] = {x=t2[i].x, y=t2[i].y, w=t2[i].w, h=t2[i].h, sprite=t2[i].sprite, behind=t2[i].behind}
    end
    return t1
end

function array_reverse(x)
    local n, m = #x, #x/2
    for i=1, m do
      x[i], x[n-i+1] = x[n-i+1], x[i]
    end
    return x
end

function draw_rotated_tile(x,y,rot,mx,my,w,flip,scale)
	scale = scale or 1
	w+=.8
	local halfw, cx  = scale*-w/2, mx + w/2 -.4
	local cs, ss, cy = cos(rot)/scale, -sin(rot)/scale, my-halfw/scale-.4
	local sx, sy, hx, hy = cx + cs*halfw, cy - ss*halfw, w*(flip and -4 or 4)*scale, w*4*scale
	
	--rect(x-hx,y-hy,x+hx,y+hy,5)
  
	for py = y-hy, y+hy do
	  tline(x-hx, py, x+hx, py, sx + ss*halfw, sy + cs*halfw, cs/8, -ss/8)
	  halfw+=1/8
	end
end



--97 tokens with Scaling and arbitrary size
function pd_rotate(x,y,rot,mx,my,w,flip,scale)
	scale=scale or 1
	w*=scale*4
  
	local cs, ss = cos(rot)*.125/scale,sin(rot)*.125/scale
	local sx, sy = mx+cs*-w, my+ss*-w
	local hx = flip and -w or w
  
	local halfw = -w
	for py=y-w, y+w do
	  tline(x-hx, py, x+hx, py, sx-ss*halfw, sy+cs*halfw, cs, ss)
	  halfw+=1
	end
  end

function dist(x1,y1,x2,y2)
	--return sqrt((x2-x1) * (x2-x1) + (y2-y1) * (y2-y1))
	local xdif=x1-x2
    local ydif=y1-y2

    local atan=atan2(xdif,ydif)

    local xdist=cos(atan)*xdif
    local ydist=sin(atan)*ydif

    return xdist+ydist
end

function clear_table(t)
	for k in pairs (t) do
		t [k] = nil
	end
end


function sstar_init()
    sp,dim,l,msp=.05,500,6,1.5
	l2=0
    spsq=msp*msp
    cam={x=rnd(dim),y=rnd(dim),vx=0,vy=0}
    stars={}
	planets={}
    for i=0,l do
        stars[i]={}
		planets[i]={}
    end
    for i=1,20 do
        for j=0,l do
            add(stars[j],{x=rnd(dim),y=rnd(dim),c=7})
        end
    end
	--for i=1,1 do
    --    for j=0,l2 do
    --        add(planets[j],{x=rnd(dim),y=rnd(dim),c=7})
    --    end
    --end
end

function sstar_update()
    local vx,vy=cam.vx,cam.vy
    cam.x+=vx
    cam.y+=vy
	
	if(btn(⬅️))vx+=sp
	if(btn(➡️))vx-=sp
	if(btn(⬆️))vy+=sp
	if(btn(⬇️))vy-=sp

    local vsq=vx*vx+vy*vy
    -- normalise vel
    if vsq>spsq then
        local vmul=msp/sqrt(vsq)
        vx*=vmul
        vy*=vmul
    end

	for planet in all(space.planets) do
		if planet.x > 0 and planet.y < 128 and planet.y > 0 and planet.y < 128 then
			if (dist(bear.x,bear.y,planet.x,planet.y) < 16 + planet.r) then
				del(space.planets,planet)
				bear.num_eaten+=1
				shake += 0.1
			end
		end
	end

	for planet in all(space.planets) do
        planet.x+=vx 
		planet.y+=vy
    end

	bear.x = 63 + cam.vx
    bear.y = 63 + cam.vy

    cam.vx,cam.vy=vx,vy
end

function sstar_draw()
    --cls()
    --for i=0,20 do rectfill(rnd(136)-4,rnd(136)-4,2,2,0)end
    --line(63,63,63+cam.vx,63+cam.vy,8)
    
    for j=0,l2 do
        --camera(cam.x/j,cam.y/j)
        for i=1,#planets[j] do
            s=planets[j][i]
			
			--circ(bear.x,bear.y,16,8) --bear hitbox

			circfill((s.x+cam.x)%128,(s.y+cam.y)%128,3,s.c)

			
        end
    end

	for j=0,l do
        --camera(cam.x/j,cam.y/j)
        for i=1,#stars[j] do
            s=stars[j][i]
            pset((s.x+cam.x)\j%128,(s.y+cam.y)\j%128,s.c)
        end
    end

    --draw_bear()

	print(count(space.planets))
end

function contains(table, val)
	for i=1,#table do
	   if table[i] == val then 
		  return true
	   end
	end
	return false
end