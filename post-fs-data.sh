# Make sure booted should completed
sed -i "/description=/c description=personalbuild by changing your perf options Big, Little Core." /data/adb/modules/personalbuild/module.prop;

# Stealing ain't cool. It is useless to use the resetprop stopped method before booting, but will use other alternatives
{
	# D-Thermal except mtSoC Mediatek devices
	resetprop --delete init.svc.thermal
	resetprop --delete init.svc.thermal_manager
	resetprop --delete init.svc.thermalloadalgod
	
 	# Other Thermal if SoC if support it
	resetprop --delete init.svc.vendor.thermal-hal-1-0
	resetprop --delete init.svc.vendor.thermal-hal-2-0
	resetprop --delete init.svc.vendor.thermal-engine
	resetprop --delete init.svc.vendor.thermal.symlinks
  	
	# Xiaomi™ / Redme, Realme mi_thermald
	resetprop --delete init.svc.mi_thermald
}&

# Overall scene
${0%/*}/scene

for i in /sys/block/*/queue/read_ahead_kb; do
	echo 128 > "$i"
	for i in /sys/block/*/queue/nr_requests; do
		echo 64 > "$i"
	done
done

for i in /sys/devices/platform/soc/1d84000.ufshc; do
	echo 0 > $i/clkgate_enable
	echo 0 > $i/clkscale_enable
	echo 0 > $i/hibern8_on_idle_enable
done

# Always return success, even if the last write fails
exit 0
