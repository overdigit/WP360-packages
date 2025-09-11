local time, otime

local clock = 0
local temp = 0
local n = 0

io.stdin:setvbuf("line")

while true do
	time = os.time()
	local line = io.read '*l'
	local temp_in, clock_in, throttled = line:match("temp=([%d%.]+)'C (%d+) (0x%x+)")
	n = n + 1
	clock = clock + tonumber(clock_in)
	temp = temp + temp_in
	if time ~= otime then
		print(("%4.1f'C   %7.2f  0x%X"):format(temp / n, clock / n / 1000000, throttled))
		clock = 0
		temp = 0
		n = 0
	end
	otime = time
end

