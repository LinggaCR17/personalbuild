# Stealing ain't cool. After booted should run...
${0%/*}/personalbuild

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

# Always return success, even if the last write fails.
exit 0
