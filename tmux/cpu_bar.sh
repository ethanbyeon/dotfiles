#!/bin/bash
#
# tmux CPU Usage Bar for macOS
#
# This script:
#  - Captures real-time CPU usage (User + System) via `top -l 2`.
#  - Displays a tmux-compatible colored bar with up to 10 blocks.
#


# Configuration
include_percentage=true
max_blocks=10

# Tmux-compatible colors for each block (adjust if desired).
# These create a gradient from dark red to pink/purple.
colors=(
  "#[fg=#500612]" "#[fg=#500612]"
  "#[fg=#740937]" "#[fg=#740937]"
  "#[fg=#9C095E]" "#[fg=#9C095E]"
  "#[fg=#CB078A]" "#[fg=#CB078A]"
  "#[fg=#FD02E4]" "#[fg=#FD02E4]"
)


generate_bar() {
  local usage=$1
  local bar=""

  # Normalize usage (0-100) to fit max_blocks
  local usage_normalized
  usage_normalized=$(echo "scale=2; ($usage / 100) * $max_blocks" | bc -l)

  local filled_blocks=$(printf "%.0f" "$usage_normalized")

  # Ensure filled_blocks is within valid range
  if (( filled_blocks > max_blocks )); then filled_blocks=$max_blocks; fi
  if (( filled_blocks < 0 )); then filled_blocks=0; fi

  local empty_blocks=$(( max_blocks - filled_blocks ))


  # Build the bar
  for i in $(seq 1 $max_blocks); do
    if (( i <= filled_blocks )); then
      bar+="${colors[$((i - 1))]}▮"
    else
      bar+="#[fg=#544E45]▯"
    fi
  done

  if $include_percentage; then
    echo "$bar $(printf "%.0f" "$usage")%"
  else
    echo "$bar"
  fi
}


# macOS-specific approach: run `top -l 2` so the second iteration has fresh data.
cpu_usage=$(
  top -l 2 2>/dev/null \
    | grep -E "^CPU" \
    | tail -1 \
    | awk '{ print $3 + $5 }' \
    || echo "0"
)

# Ensure valid numeric output
if ! [[ "$cpu_usage" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
  cpu_usage=0
fi


bar=$(generate_bar "$cpu_usage")
echo "$bar"

