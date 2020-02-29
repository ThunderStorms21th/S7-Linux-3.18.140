#!/system/bin/sh
# 
# Init TSKernel
#

TS_DIR="/data/.tskernel"
LOG="$TS_DIR/tskernel.log"

rm -f $LOG

# Mount
mount -t rootfs -o remount,rw rootfs;
mount -o remount,rw /system;
mount -o remount,rw /data;
mount -o remount,rw /;

# Create TSkernel folder
if [ ! -d $TS_DIR ]; then
	mkdir -p $TS_DIR;
fi


(
	echo $(date) "TS-Kernel LOG" >> $LOG;
	echo " " >> $LOG;

	
	# SafetyNet
	echo "## -- SafetyNet permissions" >> $LOG;
	chmod 640 /sys/fs/selinux/enforce;
	chmod 440 /sys/fs/selinux/policy;
	echo " " >> $LOG;


	# deepsleep fix
	echo "## -- DeepSleep Fix" >> $LOG;
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

	# Google play services wakelock fix
	echo "## -- GooglePlay wakelock fix" >> $LOG;
	pm enable com.google.android.gms/.update.SystemUpdateActivity;
	pm enable com.google.android.gms/.update.SystemUpdateService;
	pm enable com.google.android.gms/.update.SystemUpdateService$ActiveReceiver;
	pm enable com.google.android.gms/.update.SystemUpdateService$Receiver;
	pm enable com.google.android.gms/.update.SystemUpdateService$SecretCodeReceiver;
	echo " " >> $LOG;

	
	# Fix personalist.xml
	if [ ! -f /data/system/users/0/personalist.xml ]; then
		touch /data/system/users/0/personalist.xml;
		chmod 600 /data/system/users/0/personalist.xml;
		chown system:system /data/system/users/0/personalist.xml;
	fi

	
	# Init.d support
	echo "## -- Start Init.d support" >> $LOG;
	if [ ! -d /system/etc/init.d ]; then
	    	mkdir -p /system/etc/init.d;
	fi

	chown -R root.root /system/etc/init.d;
	chmod 777 /system/etc/init.d;

	# remove detach script
	rm -f /system/etc/init.d/*detach* 2>/dev/null;
	rm -f /system/su.d/*detach* 2>/dev/null;

	if [ "$(ls -A /system/etc/init.d)" ]; then
		chmod 777 /system/etc/init.d/*;

		for FILE in /system/etc/init.d/*; do
			echo "## Executing init.d script: $FILE" >> $LOG;
			sh $FILE >/dev/null;
	    	done;
	else
		echo "## No files found" >> $LOG;
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
		echo "## No files found" >> $LOG;
	fi
	echo "## -- End Install APK" >> $LOG;


) 2>&1 | tee -a ./$LOG;

chmod 777 $LOG;

# Unmount
mount -t rootfs -o remount,ro rootfs;
mount -o remount,ro /system;
mount -o remount,rw /data;
mount -o remount,ro /;

