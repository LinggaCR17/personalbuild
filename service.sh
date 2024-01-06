# Stealing ain't cool. Unlocking hZ without breaking the rules
(while :
do
	sf=$(service list | grep -c "SurfaceFlinger")
	
	if [ $sf -eq 1 ] && [ $sf -eq 2 ]; then
		service call SurfaceFlinger 1008 i32 1
		service call SurfaceFlinger 1035 i32 0
		service call SurfaceFlinger 1023 i32 0
		break
	else
		sleep 1
	fi
done
) &

# It is useless to use the resetprop stopped method before booting, but will use other alternatives.
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

# After booted should run...
${0%/*}/personalbuild

# Always return success, even if the last write fails.
exit 0
