#!/system/bin/sh

# ThunderStorm bash script for kernel and policy features settings v1.1
# Thanks to MoRoGoKu and djb77

# Set Variables
BB="/sbin/busybox"
RESETPROP="/sbin/resetprop -v -n"
TS_DIR="/data/.tskernel"
LOG="$TS_DIR/tskernel.log"

# Mount
mount -t rootfs -o remount,rw rootfs;
mount -o remount,rw /system;
mount -o remount,rw /data;
mount -o remount,rw /;

# Set first parameter to profile
profile=$1

# Function to apply ramdisk style settings
function write() {
    echo -n $2 > $1
}

# Load profile data
source /data/media/0/Spectrum/profiles/${profile}.profile;

# Create TSkernel folder
if [ ! -d $TS_DIR ]; then
	mkdir -p $TS_DIR;
fi

rm -f $LOG

	echo $(date) "TS-Kernel LOG" >> $LOG;
	echo " " >> $LOG;

	# Set KNOX to 0x0 on running /system
	$RESETPROP ro.boot.warranty_bit "0"
	$RESETPROP ro.warranty_bit "0"

	# Fix Samsung Related Flags
	$RESETPROP ro.fmp_config "1"
	$RESETPROP ro.boot.fmp_config "1"
	$RESETPROP sys.oem_unlock_allowed "0"

	# Fix safetynet flags
	$RESETPROP ro.boot.veritymode "enforcing"
	$RESETPROP ro.boot.verifiedbootstate "green"
	$RESETPROP ro.boot.flash.locked "1"
	$RESETPROP ro.boot.ddrinfo "00000001"
	$RESETPROP ro.build.selinux "1"
	
	# SafetyNet
	echo "## -- SafetyNet permissions" >> $LOG;
	chmod 640 /sys/fs/selinux/enforce;
	chmod 440 /sys/fs/selinux/policy;
	echo " " >> $LOG;

	# Fix personalist.xml
	echo "## -- Fix Personal list" >> $LOG;
	if [ ! -f /data/system/users/0/personalist.xml ]; then
		touch /data/system/users/0/personalist.xml
	fi
	if [ ! -r /data/system/users/0/personalist.xml ]; then
	 	chmod 600 /data/system/users/0/personalist.xml
	 	chown system:system /data/system/users/0/personalist.xml
	fi
	echo " " >> $LOG;

	# deepsleep fix
	echo "## -- DeepSleep Fix" >> $LOG;
	dmesg -n 1 -C
	echo "N" > /sys/kernel/debug/debug_enabled
	echo "N" > /sys/kernel/debug/seclog/seclog_debug
	echo "0" > /sys/kernel/debug/tracing/tracing_on
	
	if [ -f /data/adb/su/su.d/000000deepsleep ]; then
		rm -f /data/adb/su/su.d/000000deepsleep;
	fi
	
	for i in `ls /sys/class/scsi_disk/`; do
		cat /sys/class/scsi_disk/$i/write_protect 2>/dev/null | grep 1 >/dev/null;
		if [ $? -eq 0 ]; then
			echo 'temporary none' > /sys/class/scsi_disk/$i/cache_type;
		fi
	done
	echo " " >> $LOG;

	# Disabling unauthorized changes warnings...
	echo "## -- Remove SecurityLogAgent" >> $LOG;
	if [ -d /system/app/SecurityLogAgent ]; then
		rm -rf /system/app/SecurityLogAgent
	fi
	echo " " >> $LOG;
	
	# Fix personalist.xml
	echo "## -- Fix Personal list" >> $LOG;
	if [ ! -f /data/system/users/0/personalist.xml ]; then
		touch /data/system/users/0/personalist.xml;
		chmod 600 /data/system/users/0/personalist.xml;
		chown system:system /data/system/users/0/personalist.xml;
	fi
	echo " " >> $LOG;

	# RMM patch (part)
	echo "## -- Removing RMM" >> $LOG;
	if [ -d /system/priv-app/Rlc ]; then
		rm -rf /system/priv-app/Rlc
	fi
	echo " " >> $LOG;

	## ThunderStormS kill Google and Media servers script
	sleep 1
	# START LOOP 3600sec = 1h
	RUN_EVERY=10800
	(
	while : ; do
	# Google play services wakelock fix
	echo "## -- GooglePlay wakelock fix $( date +"%d-%m-%Y %H:%M:%S" )" >> $LOG;
	# KILL MEDIA
	if [ "`pgrep media`" ] && [ "`pgrep mediaserver`" ]; then
	# busybox killall -9 android.process.media
	# busybox killall -9 mediaserver
	$BB killall -9 com.google.android.gms
	$BB killall -9 com.google.android.gms.persistent
	$BB killall -9 com.google.process.gapps
	$BB killall -9 com.google.android.gsf
	$BB killall -9 com.google.android.gsf.persistent
	fi
	echo " " >> $LOG;
	
	sleep 1
	# FIX GOOGLE PLAY SERVICE
	pm enable com.google.android.gms/.update.SystemUpdateActivity
	pm enable com.google.android.gms/.update.SystemUpdateService
	pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver
	pm enable com.google.android.gms/.update.SystemUpdateService$Receiver
	pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver
	pm enable com.google.android.gsf/.update.SystemUpdateActivity
	pm enable com.google.android.gsf/.update.SystemUpdatePanoActivity
	pm enable com.google.android.gsf/.update.SystemUpdateService
	pm enable com.google.android.gsf/.update.SystemUpdateService$Receiver
	pm enable com.google.android.gsf/.update.SystemUpdateService$SecretCodeReceiver
	echo " " >> $LOG;

	sleep 10800
	done;
	)&
	# END OF LOOP
	echo " " >> $LOG;
	
	# Init.d support
	echo "## -- Start Init.d support" >> $LOG;
	if [ ! -d /vendor/etc/init.d ]; then
	    	mkdir -p /vendor/etc/init.d;
	fi

	chown -R root.root /vendor/etc/init.d;
	chmod 777 /vendor/etc/init.d;

	# remove detach script
	rm -f /vendor/etc/init.d/*detach* 2>/dev/null;
	rm -f /system/su.d/*detach* 2>/dev/null;

	if [ "$(ls -A /vendor/etc/init.d)" ]; then
		chmod 777 /vendor/etc/init.d/*;

		for FILE in /vendor/etc/init.d/*; do
			echo "## -- Executing init.d script: $FILE" >> $LOG;
			sh $FILE >/dev/null;
	    	done;
	else
		echo "## -- No files found" >> $LOG;
	fi
	echo "## -- End Init.d support" >> $LOG;
	echo " " >> $LOG;

	
	# Install APK
	echo "## -- Start Install APK" >> $LOG;
	if [ ! -d $TS_DIR/apk ]; then
		mkdir -p $TS_DIR/apk;
	fi

	# Remove tmp app on data/app
	rm -Rf /data/app/*.tmp
	
	chown -R root.root $TS_DIR/apk;
	chmod 777 $TS_DIR/apk;

	if [ "$(ls -A /$TS_DIR/apk)" ]; then
		cd $TS_DIR/apk;
		chmod 777 *;
		for apk in *.apk; do
			echo "## -- Install $apk" >> $LOG;
			pm install -r $apk;
			rm $apk;
		done;
	else
		echo "## -- No files found" >> $LOG;
	fi
	echo "## -- End Install APK" >> $LOG;
	echo " " >> $LOG;

chmod 777 $LOG;

# Unmount
mount -t rootfs -o remount,ro rootfs;
mount -o remount,ro /system;
mount -o remount,rw /data;
mount -o remount,ro /;

