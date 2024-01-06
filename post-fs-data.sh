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
	for build in stop
	do
		"$build" logd
		"$build" logd-auditctl
		"$build" logd-reinit
		"$build" statsd
		"$build" traced
		"$build" traced_perf
		"$build" traced
		"$build" probes
	done
done

swapoff /dev/block/zram0 >/dev/null 2>&1
echo 1 > /sys/block/zram0/reset

for p in $(find /sys/ -name debug_mask)
do
	echo "0" > $p
done
for e in $(find /sys/ -name debug_level)
do
	echo "0" > $e
done
for r in $(find /sys/ -name edac_mc_log_ce)
do
	echo "0" > $r
done
for s in $(find /sys/ -name edac_mc_log_ue)
do
	echo "0" > $o
done
for o in $(find /sys/ -name enable_event_log)
do
	echo "0" > $o
done
for n in $(find /sys/ -name log_ecn_error)
do
	echo "0" > $n
done

for a in $(find /sys/ -name snapshot_crashdumper)
do
	echo "0" > $a
done
for l in /sys/devices/virtual/block/*/queue/iosched
do
	echo "0" > $l/low_latency
done

if [ -e "/sys/module/xhci_hcd/parameters/wl_divide" ]; then
	echo "N" > /sys/module/xhci_hcd/parameters/wl_divide
fi

tune2fs -o journal_data_writeback /block/path/to/system;
tune2fs -O ^has_journal /block/path/to/system;
tune2fs -o journal_data_writeback /block/path/to/cache;
tune2fs -O ^has_journal /block/path/to/cache;
tune2fs -o journal_data_writeback /block/path/to/data;
tune2fs -O ^has_journal /block/path/to/data;

{
personal="/proc/gpufreq/gpufreq_limited_thermal_ignore"
if [[ -e "$personal" ]]; then
	write "1" $personal
fi
}

{
build="/sys/devices/system/cpu/sched_mc_power_savings"
if [[ -e "$build" ]]; then
	write "0" $build
fi
}

{
if [[ -e "/sys/devices/virtual/touch/touch_dev/bump_sample_rate" ]]; then
	write "1" /sys/devices/virtual/touch/touch_dev/bump_sample_rate
fi
}

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
