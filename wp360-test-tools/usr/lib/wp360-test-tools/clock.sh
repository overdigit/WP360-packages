while true ; do
	echo $(vcgencmd measure_clock arm | cut -d= -f2) $(vcgencmd get_throttled | cut -d= -f2)
done
