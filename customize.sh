stealing="$MODPATH"
aint="personalbuild"
cool="$stealing/$aint"

set_perm_recursive "$cool" root root 0777 0755
set_perm_recursive "$stealing" root root 0777 0755

set_perm_recursive "$stealing/scene" root root 0777 0755
ui_print "- $(getprop ro.boot.boot_devices)"
ui_print "- solution for all performance"

bin=xbin
if [ ! -d system/xbin ]; then
    bin=bin
    mkdir $MODPATH/system/$bin
    mv $MODPATH/system/xbin/* $MODPATH/system/$bin
    rm -rf $MODPATH/system/xbin/*
    rmdir $MODPATH/system/xbin
fi

function FindThermal() {
    for systemThermal in `ls $1 | grep $2`
    do
        if [[ "$systemThermal" == *"-BlankFile"* ]]; then
        	ui_print "- ignoring pervious file"
        elif [[ "$systemThermal" == *"-OriFile.bck"* ]]; then
        	ui_print "- ignoring conflict file"
        else
        system=system/vendor
        mkdir $MODPATH/$system/bin; mkdir $MODPATH/system/etc
            if [ $2 == "thermal" ];then
                if [ ! -f "$3/$systemThermal-BlankFile" ]; then
                	echo "" > "$3/$systemThermal-BlankFile"
                fi
                if [ ! -f "$3/$systemThermal-OriFile.bck" ]; then
                    cp -af "$1/$systemThermal" "$3/$systemThermal-OriFile.bck"
                fi
                cp -af "$3/$systemThermal-BlankFile" "$3/$systemThermal"
            else
                if [ ! -f "$3/$systemThermal" ] ; then
                    cp -af "$1/$systemThermal" "$3/$systemThermal"
                fi
            fi
        fi
    done
}

FindThermal "/system/bin" '"-OriFile.bck"' "$MODPATH/system/bin"
FindThermal "/system/bin" 'thermal' "$MODPATH/system/bin"
FindThermal "/vendor/bin" '"-OriFile.bck"' "$MODPATH/system/vendor/bin"
FindThermal "/vendor/bin" 'thermal' "$MODPATH/system/vendor/bin"
FindThermal "/vendor/etc" '"-OriFile.bck"' "$MODPATH/system/vendor/etc"
FindThermal "/vendor/etc" 'thermal' "$MODPATH/system/vendor/etc"

echo "0" > "$MODPATH/system/vendor/etc/thermalStatus.info"

set_perm_recursive $MODPATH                   0 0 0755 0777
set_perm_recursive $MODPATH/system/$bin       0 0 0755 0777

if [ $bin == "xbin" ]; then
    set_perm_recursive $MODPATH/system/bin    0 0 0755 0777
fi

set_perm_recursive $MODPATH/system/vendor/bin 0 0 0755 0777
set_perm_recursive $MODPATH/system/vendor/etc 0 0 0755 0644
set_perm_recursive $MODPATH/system/etc/zybrog 0 0 0755 0777

echo "$NVBASE/modules" > /data/zybrog
