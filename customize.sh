stealing="$MODPATH"
aint="personalbuild"
cool="$stealing/$aint"

set_perm_recursive "$cool" root root 0777 0755
set_perm_recursive "$stealing" root root 0777 0755

set_perm_recursive "$stealing/scene" root root 0777 0755
ui_print "- $(getprop ro.boot.boot_devices)"
ui_print "- solution for all performance"
