# Stealing ain't cool
{
	# D-Thermal except mtSoC
	resetprop --delete init.svc.thermal
	resetprop --delete init.svc.thermal_manager
	resetprop --delete init.svc.thermalloadalgod
}&

# Always return success, even if the last write fails
exit 0
