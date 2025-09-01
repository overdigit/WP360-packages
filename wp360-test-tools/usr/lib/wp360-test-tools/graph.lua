local time, otime

--local clock = 0
--local n = 0

io.stdin:setvbuf("line")
local ostep = 0

while true do
--	time = os.time()
	local line = io.read '*l'
        local clock_in, throttled_in = line:match("(%d+) 0x(%x+)")
	local throttled = tonumber(throttled_in, 16)
	local clock = tonumber(clock_in) / 1e6
	local step = math.floor((clock - 1500) / 50 + .5)
	local char =
		(step < 0) and "x" or
		(step < ostep) and "/" or
                (step > ostep) and "\\" or
		"|"
	step = math.max(step, 0)
	io.write(("%d|%s"):format(
		clock //1,
		(" "):rep(step)
	))
	io.write(char)
	io.write((" "):rep(19-step))
	print(("| UV:%d FC:%d TH:%d TC:%d"):format(throttled & 1, (throttled & 2) >> 1, (throttled & 4) >> 2, (throttled & 8) >> 3))
	ostep = step
end

