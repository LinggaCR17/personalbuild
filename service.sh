# Stealing ain't cool. Unlocking hZ without breaking the rules.
(while :
do
	sf="$(service list | grep -c "SurfaceFlinger")"
	
	if [ $sf -eq 1 ]; then
		break
		if [ $sf -eq 2 ]; then
			service call SurfaceFlinger 1008 i32 1
			service call SurfaceFlinger 1035 i32 0
			service call SurfaceFlinger 1023 i32 0
			break
		else
			sleep 1
		fi
	fi
done
)&

# It is useless to use the resetprop stopped method before booting, but will use other alternatives.
{
	if [ "$(getprop init.svc.thermal*)" = running ]; then
		# D-Thermal except mtSoC Mediatek devices
		resetprop --delete init.svc.thermal*
	fi
	
	# D-Thermal except mtSoC Mediatek devices
	resetprop --delete init.svc.thermal
	resetprop --delete init.svc.thermal_manager
	resetprop --delete init.svc.thermalloadalgod
	
	if [ "$(getprop init.svc.vendor.thermal*)" = running ]; then
		# Other Thermal if SoC if support it
		resetprop --delete init.svc.vendor.thermal*
	fi
	
	# Other Thermal if SoC if support it
	resetprop --delete init.svc.vendor.thermal-hal-1-0
	resetprop --delete init.svc.vendor.thermal-hal-2-0
	resetprop --delete init.svc.vendor.thermal-engine
	resetprop --delete init.svc.vendor.thermal.symlink
	
	if [ "$(getprop init.svc.mi_thermal*)" = running ]; then
		# Xiaomi™ / Redme, Realme mi_thermald
		resetprop --delete init.svc.mi_thermal*
	fi
	
	# Xiaomi™ / Redme, Realme mi_thermald
	resetprop --delete init.svc.mi_thermald
}&

# After booted should be run, personalbuild early-exec.
${0%/*}/personalbuild

# Always return success, even if the last write fails.
exit 0
