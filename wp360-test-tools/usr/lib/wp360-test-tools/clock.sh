while true ; do
	echo $(vcgencmd measure_temp) $(vcgencmd measure_clock arm | cut -d= -f2) $(vcgencmd get_throttled | cut -d= -f2)
	sleep 0.1
done
