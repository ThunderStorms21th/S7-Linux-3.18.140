#!/sbin/sh
#
# TSKernel Flash script 1.1
#
# Credit also goes to @djb77
# @lyapota, @Tkkg1994, @osm0sis
# @dwander for bits of code
# @MoRo

# Functions
ui_print() { echo -n -e "ui_print $1\n"; }

file_getprop() { grep "^$2" "$1" | cut -d= -f2; }

show_progress() { echo "progress $1 $2"; }

set_progress() { echo "set_progress $1"; }

set_perm() {
  chown $1.$2 $4
  chown $1:$2 $4
  chmod $3 $4
  chcon $5 $4
}

clean_magisk() {
	rm -rf /cache/*magisk* /cache/unblock /data/*magisk* /data/cache/*magisk* /data/property/*magisk* \
        /data/Magisk.apk /data/busybox /data/custom_ramdisk_patch.sh /data/app/com.topjohnwu.magisk* \
        /data/user*/*/magisk.db /data/user*/*/com.topjohnwu.magisk /data/user*/*/.tmp.magisk.config \
        /data/adb/*magisk* /data/adb/post-fs-data.d /data/adb/service.d /data/adb/modules* 2>/dev/null
        
        if [ -f /system/addon.d/99-magisk.sh ]; then
	  mount -o rw,remount /system
	  rm -f /system/addon.d/99-magisk.sh
	fi
}

abort() {
	ui_print "$*";
	echo "abort=1" > /tmp/aroma/abort.prop
	exit 1;
}

unmount_system() {
	umount -l /system_root 2>/dev/null
	umount -l /system 2>/dev/null
}

# Mount system
export SYSTEM_ROOT=false

block=/dev/block/platform/155a0000.ufs/by-name/SYSTEM
SYSTEM_MOUNT=/system
SYSTEM=$SYSTEM_MOUNT

# Try to detect system-as-root through $SYSTEM_MOUNT/init.rc like Magisk does
# Mount whatever $SYSTEM_MOUNT is, sometimes remount is necessary if mounted read-only

grep -q "$SYSTEM_MOUNT.*\sro[\s,]" /proc/mounts && mount -o remount,rw $SYSTEM_MOUNT || mount -o rw "$block" $SYSTEM_MOUNT

# Remount /system to /system_root if we have system-as-root and bind /system to /system_root/system (like Magisk does)
# For reference, check https://github.com/topjohnwu/Magisk/blob/master/scripts/util_functions.sh
if [ -f /system/init.rc ]; then
  mkdir /system_root
  mount --move /system /system_root
  mount -o bind /system_root/system /system
  export SYSTEM_ROOT=true
fi

# Initialice TSkernel folder
rm -rf /data/.morokernel
rm -rf /data/.helioskernel
rm -rf /data/.helios
# mkdir -p -m 777 /data/.tskernel/apk 2>/dev/null

# Variables
BB=/sbin/busybox
SDK="$(file_getprop /system/build.prop ro.build.version.sdk)"
BL=`getprop ro.bootloader`
MODEL=${BL:0:4}
MODEL1=G930
MODEL1_DESC="S7 Flat G930"
MODEL2=G935
MODEL2_DESC="S7 Edge G935"
if [ $MODEL == $MODEL1 ]; then MODEL_DESC=$MODEL1_DESC; fi
if [ $MODEL == $MODEL2 ]; then MODEL_DESC=$MODEL2_DESC; fi


#======================================
# AROMA INIT
#======================================
set_progress 0.02

ui_print "@Mount partitions"
ui_print "-- Mount /system RW"
if [ $SYSTEM_ROOT == true ]; then
	ui_print "-- Device is system-as-root"
	ui_print "-- Remounting /system as /system_root"
fi

set_progress 0.10
show_progress 0.49 -4000

## FLASH KERNEL
ui_print " "
ui_print "@Flashing ThundeRStormS kernel..."

cd /data/tmp/ts
ui_print "-- Extracting"
$BB tar -Jxf kernel.tar.xz $MODEL-boot.img
ui_print "-- Flashing ThundeRStormS kernel $MODEL-boot.img"
dd of=/dev/block/platform/155a0000.ufs/by-name/BOOT if=/data/tmp/ts/$MODEL-boot.img
ui_print "-- Done"

set_progress 0.49

#======================================
# OPTIONS
#======================================
set_progress 0.50
show_progress 0.57 -4000

## System patch
	ui_print " "
	ui_print "@ThundeRStormS - System Patching..."
	cp -rf ts/system /system

# REMOVE RO.LMK... FROM BUILD.PROP
# sed -i '/ro.lmk/d' /system/build.prop

## THUNDERTWEAKS
if [ "$(file_getprop /tmp/aroma/menu.prop chk3)" == 1 ]; then
	ui_print " "
	ui_print "@Installing ThunderTweaks App..."
	sh /data/tmp/ts/ts_clean.sh com.moro.mtweaks -as
        sh /data/tmp/ts/ts_clean.sh com.thunder.thundertweaks -as
        sh /data/tmp/ts/ts_clean.sh com.hades.hKtweaks -as

	mkdir -p /data/media/0/ThunderTweaks

## DELETE OLDER APPS
	rm -f /sdcard/ThunderTweaks/*.*
	rm -rf /data/.mtweaks*
	rm -rf /data/.hktweaks*
	rm -rf /data/magisk_backup*
	# rm -rf /sdcard/ThunderTweaks/*.*

# COPY NEW APP
	# cp -rf /data/tmp/ts/ttweaks/*.apk /data/.tskernel/apk
	cp -rf /data/tmp/ts/ttweaks/*.apk /data/media/0/ThunderTweaks
fi

## TS swap off
if [ "$(file_getprop /tmp/aroma/menu.prop chk4)" == 1 ]; then
	ui_print " "
	ui_print "@Installing ThundeRStormS VNSWAP OFF..."
	cp -rf /data/tmp/ts/swapoff/*.* /system/etc/init.d
fi

## SPECTRUM PROFILES
if [ "$(file_getprop /tmp/aroma/menu.prop chk6)" == 1 ]; then
	ui_print " "
	ui_print "@Install Spectrum Profiles..."
	mkdir -p /data/media/0/Spectrum/profiles 2>/dev/null;
	cp -rf /data/tmp/ts/profiles/. /data/media/0/Spectrum/profiles/
fi

## Remove GameOptimizing Services
if [ "$(file_getprop /tmp/aroma/menu.prop chk11)" == 1 ]; then
	ui_print " "
	ui_print "@Removing GameOptimizer..."
	rm -rf /system/app/GameOptimizer
	rm -rf /system/app/GameOptimizingService
fi

set_progress 0.58

