#!/system/bin/sh
# 
# Init TSKernel
#

BB="/sbin/busybox"
TS_DIR="/data/.tskernel"
LOG="$TS_DIR/tskernel.log"

# Mount
mount -t rootfs -o rw,remount rootfs;
mount -o rw,remount /system;
mount -o rw,remount /data;
mount -o rw,remount /;

rm -f $LOG

# Create morokernel folder
if [ ! -d $TS_DIR ]; then
	mkdir -p $TS_DIR;
fi

	echo $(date) "TS-Kernel LOG" >> $LOG;
	echo " " >> $LOG;

	# SafetyNet
	# SELinux (0 / 640 = Permissive, 1 / 644 = Enforcing)
	echo "## -- SafetyNet permissions" >> $LOG;
	chmod 640 /sys/fs/selinux/enforce;
	chmod 440 /sys/fs/selinux/policy;
	echo " " >> $LOG;

	# deepsleep fix
	echo "## -- DeepSleep Fix" >> $LOG;

	dmesg -n 1 -C
	echo "N" > /sys/kernel/debug/debug_enabled
	echo "N" > /sys/kernel/debug/seclog/seclog_debug
	echo "0" > /sys/kernel/debug/tracing/tracing_on
	
	for i in `ls /sys/class/scsi_disk/`; do
		cat /sys/class/scsi_disk/$i/write_protect 2>/dev/null | grep 1 >/dev/null;
		if [ $? -eq 0 ]; then
			echo 'temporary none' > /sys/class/scsi_disk/$i/cache_type;
		fi
	done
	echo " " >> $LOG;

	# Fix personalist.xml
	if [ ! -f /data/system/users/0/personalist.xml ]; then
		touch /data/system/users/0/personalist.xml;
		chmod 600 /data/system/users/0/personalist.xml;
		chown system:system /data/system/users/0/personalist.xml;
	fi

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
	# $BB killall -9 android.process.media
	# $BB killall -9 mediaserver
	$BB killall -9 com.google.android.gms
	$BB killall -9 com.google.android.gms.persistent
	$BB killall -9 com.google.process.gapps
	$BB killall -9 com.google.android.gsf
	$BB killall -9 com.google.android.gsf.persistent
	fi
	
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
	
	# Init.d support
	echo "## -- Start Init.d support" >> $LOG;
	if [ ! -d /system/etc/init.d ]; then
	    	mkdir -p /system/etc/init.d;
	fi

	chown -R root.root /system/etc/init.d;
	chmod 777 /system/etc/init.d;

	# remove detach script
	rm -f /system/etc/init.d/ts_swapoff.sh 2>/dev/null;
	rm -f /system/etc/init.d/feravolt_gms.sh 2>/dev/null;
	rm -f /system/etc/init.d/tskillgooogle.sh 2>/dev/null;
	rm -f /system/etc/init.d/*detach* 2>/dev/null;
	rm -rf /data/magisk_backup_* 2>/dev/null;

	if [ "$(ls -A /system/etc/init.d)" ]; then
		chmod 777 /system/etc/init.d/*;

		for FILE in /system/etc/init.d/*; do
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
			echo "## Install $apk" >> $LOG;
			pm install -r $apk;
			rm $apk;
		done;
	else
		echo "## -- No files found" >> $LOG;
	fi
	echo "## -- End Install APK" >> $LOG;


chmod 777 $LOG;

# Unmount
mount -t rootfs -o ro,remount rootfs;
mount -o ro,remount /system;
mount -o rw,remount /data;
mount -o ro,remount /;

