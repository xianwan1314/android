#!/bin/sh -e

echo 0 > /sys/module/msm_thermal/core_control/enabled
echo N > /sys/module/msm_thermal/parameters/enabled
chmod 777 /sys/devices/system/cpu/cpu0/cpufreq/*
echo 1209600 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
chmod 777 /sys/devices/system/cpu/cpu1/cpufreq/*
echo 1209600 > /sys/devices/system/cpu/cpu1/cpufreq/scaling_max_freq
chmod 777 /sys/devices/system/cpu/cpu2/cpufreq/*
echo 1209600 > /sys/devices/system/cpu/cpu2/cpufreq/scaling_max_freq
chmod 777 /sys/devices/system/cpu/cpu3/cpufreq/*
echo 1209600 > /sys/devices/system/cpu/cpu3/cpufreq/scaling_max_freq
echo 10 > /sys/module/cpu_boost/parameters/input_boost_ms
echo '0:307200 1:307200 2:307200 3:307200' > /sys/module/cpu_boost/parameters/input_boost_freq
echo powersave > /sys/class/kgsl/kgsl-3d0/devfreq/governor
echo 0 > /sys/kernel/dyn_fsync/Dyn_fsync_active
echo 60 > /proc/sys/vm/swappiness
echo noop > /sys/block/sda/queue/scheduler
echo 128 > /sys/block/sda/queue/read_ahead_kb
echo 1 > /sys/module/msm_thermal/core_control/enabled
echo Y > /sys/module/msm_thermal/parameters/enabled