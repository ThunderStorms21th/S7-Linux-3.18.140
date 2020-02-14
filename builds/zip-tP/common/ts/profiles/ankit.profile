# Ankit
   
   # Little CPU
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactiveS9
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 234000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1586000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/go_hispeed_load
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/go_hispeed_load 90
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/above_hispeed_delay
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/above_hispeed_delay "19000 1274000:39000"
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_rate
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_rate 20000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/hispeed_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/hispeed_freq 858000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_slack
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_slack 20000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/target_loads
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/target_loads "75 1170000:85"
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/min_sample_time
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/min_sample_time 40000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/mode
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/mode 0
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boost
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boost 0
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/io_is_busy
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/io_is_busy 0
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/param_index
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/param_index 0
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boostpulse_duration
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boostpulse_duration 400000

   # Big CPU
   chmod 0644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor ondemand
   chmod 0644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 208000
   chmod 0644 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 2080000
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/ondemand/up_threshold
   write /sys/devices/system/cpu/cpu0/cpufreq/ondemand/up_threshold 97
   chmod 0644 /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate
   write /sys/devices/system/cpu/cpu0/cpufreq/ondemand/sampling_rate 50000

   # CPU HOTPLUG
   write /sys/power/cpuhotplug/enabled 1
   write /sys/module/autosmp/parameters/enabled N
   write /sys/devices/system/cpu/cpufreq/mp-cpufreq/cluster1_all_cores_max_freq 0
   write /sys/module/workqueue/parameters/power_efficient Y

   # Samsung Hotplug settings
   chmod 0664 /sys/power/cpuhotplug/max_online_cpu
   write /sys/power/cpuhotplug/max_online_cpu 8
   chmod 0664 /sys/power/cpuhotplug/min_online_cpu
   write /sys/power/cpuhotplug/min_online_cpu 1

   # FINGERPRINT BOOST
   write /sys/kernel/fp_boost/enabled 0

   # INPUT BOOST CPU
   write /sys/module/cpu_boost/parameters/input_boost_enabled 0

   # HMP
   chmod 0644 /sys/kernel/hmp/up_threshold
   write /sys/kernel/hmp/up_threshold 600
   chmod 0644 /sys/kernel/hmp/down_threshold
   write /sys/kernel/hmp/down_threshold 225

   # GPU
   chmod 0644 /sys/devices/14ac0000.mali/max_clock
   write /sys/devices/14ac0000.mali/max_clock 650
   chmod 0644 /sys/devices/14ac0000.mali/min_clock
   write /sys/devices/14ac0000.mali/min_clock 260
   chmod 0644 /sys/devices/14ac0000.mali/power_policy
   write /sys/devices/14ac0000.mali/power_policy coarse_demand
   chmod 0644 /sys/devices/14ac0000.mali/dvfs_governor
   write /sys/devices/14ac0000.mali/dvfs_governor 1
   chmod 0644 /sys/devices/14ac0000.mali/highspeed_clock
   write /sys/devices/14ac0000.mali/highspeed_clock 419
   chmod 0644 /sys/devices/14ac0000.mali/highspeed_load
   write /sys/devices/14ac0000.mali/highspeed_load 93
   chmod 0644 /sys/devices/14ac0000.mali/highspeed_delay
   write /sys/devices/14ac0000.mali/highspeed_delay 1
   write /sys/devices/14ac0000.mali/throttling1 600
   write /sys/devices/14ac0000.mali/throttling2 546
   write /sys/devices/14ac0000.mali/throttling3 419
   write /sys/devices/14ac0000.mali/throttling4 338
   write /sys/devices/14ac0000.mali/trippimg 260
   chmod 0664 /sys/kernel/hmp/down_compensation_high_freq
   write /sys/kernel/hmp/down_compensation_high_freq 962000
   chmod 0664 /sys/kernel/hmp/down_compensation_mid_freq
   write /sys/kernel/hmp/down_compensation_mid_freq 858000
   chmod 0664 /sys/kernel/hmp/down_compensation_low_freq
   write /sys/kernel/hmp/down_compensation_low_freq 754000
   write /proc/sys/kernel/random/write_wakeup_threshold 640
   write /proc/sys/kernel/random/read_wakeup_threshold 64

   write /proc/sys/vm/dirty_expire_centisecs 1000
   write /proc/sys/vm/dirty_writeback_centisecs 2000

   # IO Scheduler
   write /sys/block/sda/queue/scheduler deadline
   write /sys/block/sda/queue/read_ahead_kb 512
   write /sys/block/mmcblk0/queue/scheduler deadline
   write /sys/block/mmcblk0/queue/read_ahead_kb 768
   write /sys/block/sda/queue/iostats 0
   write /sys/block/mmcblk0/queue/iostats 0
   write /sys/block/sda/queue/rq_affinity 1
   write /sys/block/mmcblk0/queue/rq_affinity 1

   # Wakelocks
   write /sys/module/wakeup/parameters/enable_sensorhub_wl 0
   write /sys/module/wakeup/parameters/enable_ssp_wl 0
   write /sys/module/wakeup/parameters/enable_bcmdhd4359_wl 1
   write /sys/module/wakeup/parameters/enable_bluedroid_timer_wl 0
   write /sys/module/wakeup/parameters/enable_wlan_wake_wl 1
   write /sys/module/sec_battery/parameters/wl_polling 8
   write /sys/module/sec_nfc/parameters/wl_nfc 1

   # Misc
   write /sys/module/sync/parameters/fsync_enabled 1
   write /sys/kernel/dyn_fsync/Dyn_fsync_active 0
   write /sys/kernel/sched/gentle_fair_sleepers 0
   write /sys/kernel/sched/arch_power 0
   write /sys/kernel/power_suspend/power_suspend_mode 2
   write /proc/sys/net/ipv4/tcp_congestion_control bic

   # LMK
   write /sys/module/lowmemorykiller/parameters/minfree "18920,23552,32256,42472,65536,92400"
   write /proc/sys/vm/vfs_cache_pressure 70
   write /proc/sys/vm/swappiness 150

   # WiFi
   setprop wifi.supplicant_scan_interval 500





