local time, otime

local clock = 0
local n = 0

io.stdin:setvbuf("line")

while true do
	time = os.time()
	local line = io.read '*l'
	local clock_in, throttled = line:match("(%d+) (0x%x+)")
	n = n + 1
	clock = clock + tonumber(clock_in)
	if time ~= otime then
		print(("%g"):format(clock / n / 1000000))
		os.execute("vcgencmd measure_temp")
		clock = 0
		n = 0
	end
	otime = time
end

