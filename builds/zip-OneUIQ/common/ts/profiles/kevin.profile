# Thunderstorms Battery Optimizer - by Kevin

   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor thunderstorm2
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 338000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1586000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/go_hispeed_load
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/go_hispeed_load 85
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/above_hispeed_delay
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/above_hispeed_delay "30000 1066000:40000"
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/timer_rate
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/timer_rate 30000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/hispeed_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/hispeed_freq 650000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/timer_slack
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/timer_slack 20000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/target_loads
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/target_loads "65 1066000:70"
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/min_sample_time
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/min_sample_time 50000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/mode
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/mode 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/boost
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/boost 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/io_is_busy
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/io_is_busy 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm/param_index
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/param_index 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/boostpulse_duration
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/boostpulse_duration 20000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/down_low_load_threshold
   write /sys/devices/system/cpu/cpu0/cpufreq/thunderstorm2/down_low_load_threshold 4

   # Big CPU
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor thunderstorm2
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 416000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 2288000
   chmod 0444 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/go_hispeed_load
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/go_hispeed_load 95
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/above_hispeed_delay
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/above_hispeed_delay "40000 1560000:49000 1664000:49000"
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/timer_rate
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/timer_rate 30000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/hispeed_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/hispeed_freq 1040000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/timer_slack
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/timer_slack 20000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/target_loads
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm/target_loads "80 1040000:81 1352000:87 1664000:90"
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/min_sample_time
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/min_sample_time 50000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/mode
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/mode 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/boost
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/boost 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/io_is_busy
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/io_is_busy 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/param_index
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/param_index 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/boostpulse_duration
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/boostpulse_duration 20000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/down_low_load_threshold
   write /sys/devices/system/cpu/cpu4/cpufreq/thunderstorm2/down_low_load_threshold 6

   # CPU HOTPLUG
   write /sys/power/cpuhotplug/enabled 0
   write /sys/module/autosmp/parameters/enabled 1
   write /sys/devices/system/cpu/cpufreq/mp-cpufreq/cluster1_all_cores_max_freq 0
   
   # AutoSMP Hotplug settings | bc - big core , lc - little core
   echo 15 > /sys/kernel/autosmp/conf/cpufreq_down_bc;
   # range 0 to 100
   echo 10 > /sys/kernel/autosmp/conf/cpufreq_down_lc;
   # range 0 to 100
   echo 85 > /sys/kernel/autosmp/conf/cpufreq_up_bc;
   # range 0 to 100
   echo 65 > /sys/kernel/autosmp/conf/cpufreq_up_lc;
   # range 0 to 100
   echo 2 > /sys/kernel/autosmp/conf/cycle_down;
   # max cycles 0 to 8
   echo 1 > /sys/kernel/autosmp/conf/cycle_up;
   # max cycyles 0 to 8
   echo 120 > /sys/kernel/autosmp/conf/delay;
   # range 0 to 500ms
   echo 4 > /sys/kernel/autosmp/conf/max_cpus_bc;
   # max cores ON  - 1 to 4
   echo 4 > /sys/kernel/autosmp/conf/max_cpus_lc;
   # max cores ON  - 1 to 4
   echo 2 > /sys/kernel/autosmp/conf/min_cpus_bc;
   # min cores OFF - 1 to 4
   echo 3 > /sys/kernel/autosmp/conf/min_cpus_lc;
   # min cores OFF - 1 to 4
   echo 1 > /sys/kernel/autosmp/conf/scroff_single_core;
   # 1- enable, 0 - disable
   

   # HMP
   chmod 0664 /sys/kernel/hmp/up_threshold
   write /sys/kernel/hmp/up_threshold 900
   chmod 0664 /sys/kernel/hmp/down_threshold
   write /sys/kernel/hmp/down_threshold 340
   write /sys/kernel/hmp/down_compensation_threshold 140
   write /sys/kernel/hmp/down_comepnsation_timeout 30
   chmod 0664 /sys/kernel/hmp/down_compensation_high_freq
   write /sys/kernel/hmp/down_compensation_high_freq 962000
   chmod 0664 /sys/kernel/hmp/down_compensation_mid_freq
   write /sys/kernel/hmp/down_compensation_mid_freq 858000
   chmod 0664 /sys/kernel/hmp/down_compensation_low_freq
   write /sys/kernel/hmp/down_compensation_low_freq 754000
   write /sys/devices/14ac0000.mali/throttling1 600
   write /sys/devices/14ac0000.mali/throttling2 546
   write /sys/devices/14ac0000.mali/throttling3 419
   write /sys/devices/14ac0000.mali/throttling4 338
   write /sys/devices/14ac0000.mali/trippimg 260
   write /proc/sys/kernel/random/write_wakeup_threshold 64
   write /proc/sys/kernel/random/read_wakeup_threshold 64
   write /proc/sys/vm/dirty_expire_centisecs 500
   write /proc/sys/vm/dirty_writeback_centisecs 1000

   # GPU
   chmod 0664 /sys/devices/14ac0000.mali/max_clock
   write /sys/devices/14ac0000.mali/max_clock 702
   chmod 0664 /sys/devices/14ac0000.mali/min_clock
   write /sys/devices/14ac0000.mali/min_clock 112
   chmod 0664 /sys/devices/14ac0000.mali/power_policy
   write /sys/devices/14ac0000.mali/power_policy coarse_demand
   chmod 0664 /sys/devices/14ac0000.mali/dvfs_governor
   write /sys/devices/14ac0000.mali/dvfs_governor 1
   chmod 0664 /sys/devices/14ac0000.mali/highspeed_clock
   write /sys/devices/14ac0000.mali/highspeed_clock 419
   chmod 0664 /sys/devices/14ac0000.mali/highspeed_load
   write /sys/devices/14ac0000.mali/highspeed_load 90
   chmod 0664 /sys/devices/14ac0000.mali/highspeed_delay
   write /sys/devices/14ac0000.mali/highspeed_delay 0

   # IO Scheduler
   write /sys/block/sda/queue/scheduler row
   write /sys/block/sda/queue/read_ahead_kb 384
   write /sys/block/mmcblk0/queue/scheduler row
   write /sys/block/mmcblk0/queue/read_ahead_kb 1024
   write /sys/block/sda/queue/iostats 0
   write /sys/block/mmcblk0/queue/iostats 0
   write /sys/block/sda/queue/rq_affinity 1
   write /sys/block/mmcblk0/queue/rq_affinity 1
   write /sys/block/sda/queue/nr_requests 512
   write /sys/block/mmcblk0/queue/nr_requests 512

   # Wakelocks
   write /sys/module/wakeup/parameters/enable_sensorhub_wl 0
   write /sys/module/wakeup/parameters/enable_ssp_wl 0
   write /sys/module/wakeup/parameters/enable_bcmdhd4359_wl 0
   write /sys/module/wakeup/parameters/enable_bluedroid_timer_wl 0
   write /sys/module/wakeup/parameters/enable_wlan_wake_wl 0
   write /sys/module/sec_battery/parameters/wl_polling 2
   write /sys/module/sec_nfc/parameters/wl_nfc 1

   # Misc
   write /sys/module/sync/parameters/fsync_enabled 1
   write /sys/kernel/dyn_fsync/Dyn_fsync_active 1
   write /sys/kernel/sched/gentle_fair_sleepers 0
   write /sys/kernel/sched/arch_power 1
   write /sys/kernel/power_suspend/power_suspend_mode 3
   #write /sys/kernel/power_suspend/power_suspend_mode 1
   #write /sys/kernel/power_suspend/power_suspend_state 1

   write /proc/sys/net/ipv4/tcp_congestion_control westwood

   # SWAP
   write /proc/sys/vm/swappiness 170
   write /proc/sys/vm/vfs_cache_pressure 85

   # LMK
   write /sys/module/lowmemorykiller/parameters/minfree "18432,23040,27648,32256,56064,81152"

   # WiFi
   setprop wifi.supplicant_scan_interval 200



