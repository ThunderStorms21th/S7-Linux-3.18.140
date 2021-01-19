#  Thunderstorms - Shariq v7 final

   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor interactiveS9
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq 130000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq 1586000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/go_hispeed_load
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/go_hispeed_load 98
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/above_hispeed_delay
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/above_hispeed_delay "30000 858000:27000 962000:25000"
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_rate
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_rate 30000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/hispeed_freq
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/hispeed_freq 858000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_slack
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/timer_slack 40000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/target_loads
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/target_loads "75 1066000:85"
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/min_sample_time
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/min_sample_time 40000
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/mode
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/mode 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boost
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boost 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/io_is_busy
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/io_is_busy 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/param_index
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/param_index 0
   chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boostpulse_duration
   write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/boostpulse_duration 40000
   # chmod 0664 /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/down_low_load_threshold
   # write /sys/devices/system/cpu/cpu0/cpufreq/interactiveS9/down_low_load_threshold 20

   # Big CPU
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor interactiveS9
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq 208000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/scaling_max_freq 2080000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/go_hispeed_load
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/go_hispeed_load 98
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/above_hispeed_delay
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/above_hispeed_delay "40000 1040000:30000 1144000:30000"
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/timer_rate
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/timer_rate 30000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/hispeed_freq
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/hispeed_freq 1040000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/timer_slack
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/timer_slack 40000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/target_loads
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/target_loads "85 1040000:90 1248000:95"
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/min_sample_time
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/min_sample_time 40000
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/mode
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/mode 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/boost
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/boost 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/io_is_busy
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/io_is_busy 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/param_index
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/param_index 0
   chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/boostpulse_duration
   write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/boostpulse_duration 40000
   # chmod 0664 /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/down_low_load_threshold
   # write /sys/devices/system/cpu/cpu4/cpufreq/interactiveS9/down_low_load_threshold 25

   # CPU HOTPLUG MAIN SETTINGS
   write /sys/power/cpuhotplug/enabled 1
   write /sys/module/autosmp/parameters/enabled N
   write /sys/devices/system/cpu/cpufreq/mp-cpufreq/cluster1_all_cores_max_freq 0
   write /sys/module/workqueue/parameters/power_efficient Y

   # Samsung Hotplug settings
   chmod 0664 /sys/power/cpuhotplug/max_online_cpu
   write /sys/power/cpuhotplug/max_online_cpu 8
   chmod 0664 /sys/power/cpuhotplug/min_online_cpu
   write /sys/power/cpuhotplug/min_online_cpu 1
   chmod 0664 /sys/power/cpuhotplug/governor/dual_change_ms
   write /sys/power/cpuhotplug/governor/dual_change_ms 80
   chmod 0644 /sys/power/cpuhotplug/governor/enabled
   write /sys/power/cpuhotplug/governor/enabled 1
   chmod 0644 /sys/power/cpuhotplug/governor/lit_multi_ratio
   write /sys/power/cpuhotplug/governor/lit_multi_ratio 140
   chmod 0644 /sys/power/cpuhotplug/governor/big_mode_dual
   write /sys/power/cpuhotplug/governor/big_mode_dual 7
   chmod 0644 /sys/power/cpuhotplug/governor/big_mode_normal
   write /sys/power/cpuhotplug/governor/big_mode_normal 5
   chmod 0644 /sys/power/cpuhotplug/governor/to_dual_ratio
   write /sys/power/cpuhotplug/governor/to_dual_ratio 65
   chmod 0644 /sys/power/cpuhotplug/governor/to_quad_ratio
   write /sys/power/cpuhotplug/governor/to_quad_ratio 100

   # FINGERPRINT BOOST
   write /sys/kernel/fp_boost/enabled 0

   # INPUT BOOST CPU
   write /sys/module/cpu_boost/parameters/input_boost_enabled 0

   # HMP
   chmod 0664 /sys/kernel/hmp/up_threshold
   write /sys/kernel/hmp/up_threshold 900
   chmod 0664 /sys/kernel/hmp/down_threshold
   write /sys/kernel/hmp/down_threshold 380
   chmod 0644 /sys/kernel/hmp/down_compensation_enabled 
   write /sys/kernel/hmp/down_compensation_enabled 1
   chmod 0644 /sys/kernel/hmp/down_compensation_threshold
   write /sys/kernel/hmp/down_compensation_threshold 163
   chmod 0644 /sys/kernel/hmp/down_compensation_timeout
   write /sys/kernel/hmp/down_compensation_timeout 25
   chmod 0644 /sys/kernel/hmp/sb_up_threshold
   write /sys/kernel/hmp/sb_up_threshold 254
   chmod 0644 /sys/kernel/hmp/sb_down_threshold
   write /sys/kernel/hmp/sb_down_threshold 163
   chmod 0664 /sys/kernel/hmp/down_compensation_high_freq
   write /sys/kernel/hmp/down_compensation_high_freq 858000
   chmod 0664 /sys/kernel/hmp/down_compensation_mid_freq
   write /sys/kernel/hmp/down_compensation_mid_freq 754000
   chmod 0664 /sys/kernel/hmp/down_compensation_low_freq
   write /sys/kernel/hmp/down_compensation_low_freq 650000

   # GPU
   write /sys/devices/14ac0000.mali/throttling1 546
   write /sys/devices/14ac0000.mali/throttling2 419
   write /sys/devices/14ac0000.mali/throttling3 338
   write /sys/devices/14ac0000.mali/throttling4 260
   write /sys/devices/14ac0000.mali/trippimg 112
   chmod 0664 /sys/devices/14ac0000.mali/max_clock
   write /sys/devices/14ac0000.mali/max_clock 650
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
   write /sys/devices/14ac0000.mali/highspeed_delay 1

   # IO Scheduler
   write /sys/block/sda/queue/scheduler noop
   write /sys/block/sda/queue/read_ahead_kb 128
   write /sys/block/mmcblk0/queue/scheduler noop
   write /sys/block/mmcblk0/queue/read_ahead_kb 128
   write /sys/block/sda/queue/iostats 1
   write /sys/block/mmcblk0/queue/iostats 1
   write /sys/block/sda/queue/rq_affinity 1
   write /sys/block/mmcblk0/queue/rq_affinity 1
   write /sys/block/sda/queue/nr_requests 256
   write /sys/block/mmcblk0/queue/nr_requests 256

   # Wakelocks
   write /sys/module/wakeup/parameters/enable_sensorhub_wl 0
   write /sys/module/wakeup/parameters/enable_mmc0_detect_wl 1
   write /sys/module/wakeup/parameters/enable_wlan_wd_wake_wl 0
   write /sys/module/wakeup/parameters/enable_wlan_rx_wake_wl 0
   write /sys/module/wakeup/parameters/enable_wlan_ctrl_wake_wl 0
   write /sys/module/wakeup/parameters/enable_ssp_wl 0
   write /sys/module/wakeup/parameters/enable_bcmdhd4359_wl 0
   write /sys/module/wakeup/parameters/enable_bluedroid_timer_wl 0
   write /sys/module/wakeup/parameters/enable_wlan_wake_wl 0
   write /sys/module/sec_battery/parameters/wl_polling 3
   write /sys/module/sec_nfc/parameters/wl_nfc 1

   # Misc
   write /sys/module/sync/parameters/fsync_enabled 1
   write /sys/kernel/dyn_fsync/Dyn_fsync_active 0
   write /sys/kernel/sched/gentle_fair_sleepers 0
   write /sys/kernel/sched/arch_power 0
   write /sys/kernel/power_suspend/power_suspend_mode 3

   write /proc/sys/net/ipv4/tcp_congestion_control bic

   # ENTROPY
   write /proc/sys/kernel/random/write_wakeup_threshold 64
   write /proc/sys/kernel/random/read_wakeup_threshold 64

   # SWAP
   write /proc/sys/vm/swappiness 60
   write /proc/sys/vm/vfs_cache_pressure 45
   write /proc/sys/vm/dirty_expire_centisecs 1500
   write /proc/sys/vm/dirty_writeback_centisecs 2500

   # Boeffla wakelocks
   write /sys/devices/virtual/misc/boeffla_wakelock_blocker/wakelock_blocker 'wlan_pm_wake;wlan_rx_wake;wlan_wake;wlan_ctrl_wake;wlan_txfl_wake;BT_bt_wake;BT_host_wake;nfc_wake_lock;rmnet0;nfc_wake_lock;bluetooth_timer;event0;GPSD;umts_ipc0;NETLINK;ssp_comm_wake_lock;epoll_system_server_file:[timerfd4_system_server];epoll_system_server_file:[timerfd7_system_server];epoll_InputReader_file:event1;epoll_system_server_file:[timerfd5_system_server];epoll_InputReader_file:event10;epoll_InputReader_file:event0;epoll_InputReader_epollfd;epoll_system_server_epollfd'

   write /sys/kernel/autosmp/conf/scroff_single_core 0
   # 1- enable, 0 - disable

