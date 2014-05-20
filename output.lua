local TEXT = "aa"

local function handler (evt)
	local socket = require "socket"
	while true do
		local client = socket.connect('warm-harbor-2019.herokuapp.com',80)
		client:send("GET /get_tweets.json HTTP/1.0\r\nHost: warm-harbor-2019.herokuapp.com\r\n\r\n")
		local s, status, partial = client:receive(1024)
		TEXT = string.gsub(partial, "HTTP(.*)Connection: Close(%s+)", "")
		socket.select(nil, nil, 5)
		redraw()
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

event.register(handler)