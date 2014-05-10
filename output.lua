require 'tcp'
require "socket"

function sleep(sec)
    socket.select(nil, nil, sec)
end

local TEXT = ""
local tweets = {"#PinkFloyd The sun is the same in a relative way, but you're older, Shorter of breath, and one day closer to death.", 
				"Chegou! Revista @RollingStone - #PinkFloyd (Edição Especial de Colecionador)",
				"Que existe musica boa no mundo todo mundo sabe agora Another Brick in the Wall é um nível quase que inalcansavel de boa música #PinkFloyd",
				"#PinkFloyd Baterista explica possibilidades de reunião da banda. Dos ex-integrantes vivos da formação clássica...",
				"#PinkFloyd é Sempre Uma Ótima Opção, bora de Shine On You Crazy",
				"Melhor música pra se ouvir antes de dormir! #pinkfloyd #pulse"}

local function handler (evt)
	for i=1, 6 do
      TEXT = tweets[i]
	  redraw()
	  sleep(10)
    end
	
end

local dx, dy = canvas:attrSize()
canvas:attrFont('vera', 1*dy/4)
function redraw ()
	canvas:attrColor('black')
	canvas:drawRect('fill', 0,0, dx,dy)

	canvas:attrColor('white')
	canvas:drawText(0,0, TEXT)

	canvas:flush()
end
--[[

local function handler (evt)
	if evt.class ~= 'ncl' then return end

	if evt.type == 'attribution' then
		if evt.name == 'text' then
			if evt.action == 'start' then
				TEXT = evt.value
				evt.action = 'stop'
				event.post(evt)
			end
		end
	end

	tcp.execute(
        function ()
            tcp.connect('www.google.com.br', 80)
            tcp.send('GET /#q=teste')
            local result = tcp.receive()
            if result then
		        result = string.match(result, 'Location: http://(.-)\r?\n') or 'nao encontrado'
	        else
		        result = 'error: ' .. evt.error
	        end
	        local evt = {
		        class = 'ncl',
		        type  = 'attribution',
		        name  = 'result',
		        value = result,
	        }
	        evt.action = 'start'; event.post(evt)
	        evt.action = 'stop' ; event.post(evt)
            tcp.disconnect()
        end
    )

	redraw()
end
--]]
event.register(handler)
