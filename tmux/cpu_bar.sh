#!/bin/bash

# Configuration
include_percentage=true
max_blocks=10

generate_bar() {
  local load=$1
  local cores=$2
  local bar=""

  read load_ratio load_normalized load_percentage <<<$(echo "
    scale=2;
    ratio = $load / $cores;
    normalized = ratio * $max_blocks;
    percentage = ratio * 100;
    print ratio, \" \", normalized, \" \", percentage
  " | bc -l)

  local filled_blocks=$(printf "%.0f" "$load_normalized")
  local empty_blocks=$((max_blocks - filled_blocks))
  local load_percentage_rounded=$(printf "%.0f" "$load_percentage")

  colors=(
    "#[fg=#63030E]"
    "#[fg=#63030E]"
    "#[fg=#800412]"
    "#[fg=#800412]"
    "#[fg=#9E0516]"
    "#[fg=#9E0516]"
    "#[fg=#BC061A]"
    "#[fg=#BC061A]"
    "#[fg=#D9071E]"
    "#[fg=#D9071E]"
  )

  # Generate bar
  for i in $(seq 1 $max_blocks); do
    if ((i <= filled_blocks)); then
      bar="${bar}${colors[$((i - 1))]}▮"
    else
      bar="${bar}#[fg=#544E45]▯"
    fi
  done

  if $include_percentage; then
    echo "$bar ${load_percentage_rounded}%"
  else
    echo "$bar"
  fi
}

# macOS-specific command for 5-minute load average
load_avg=$(sysctl -n vm.loadavg | awk '{print $2}')
core_count=$(sysctl -n hw.ncpu)

bar=$(generate_bar "$load_avg" "$core_count")
echo "$bar"

