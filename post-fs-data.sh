# Stealing ain't cool. Make sure booted should be completed...
sed -i "/description=/c description=personalbuild by changing your perf options Big, Little Core." /data/adb/modules/personalbuild/module.prop;

# Overall scene
${0%/*}/scene

for personal in /sys/block/*/queue/read_ahead_kb
do
	echo 32 > "$personal"
	for build in /sys/block/*/queue/nr_requests
	do
		echo 32 > "$build"
	done
done

# Enabling after this 'exec' and you can see it directly from here...
for personal in /sys/devices/platform/soc/1d84000.ufshc
do
	echo 0 > "$personal"/clkgate_enable
	echo 0 > "$personal"/clkscale_enable
	echo 0 > "$personal"/hibern8_on_idle_enable
done

for personal in /sys/block/*/queue/iostats
do
	echo 0 > "$personal"
	for build in /sys/block/dm-*/queue/iostats
	do
		echo 0 > "$build"
	done 
done 

for personal in /sys/module/*/parameters/debug_mask
do 
	echo 0 > "$personal"
	for build in /sys/module/*/parameters/debug_level
	do 
		echo 0 > "$build"
	done
done

# Always return success, even if the last write fails.
exit 0
