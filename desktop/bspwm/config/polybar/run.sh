#!/usr/bin/env zsh
# Prerequsites:
#   1. Asset wallpapers: my wallpapers are located at $DOTTY_HOME/asssets/wallpapers. Wallpapers need to be named
#   after ${color}-#.${ext}, e.g. light-blue-1.jpg.
#   2. Polybar.
#   3. Feh and bspc is not required, but it will tune the theme for these apps.
# Usage:
#   The script takes one parameter, which is the CYCLE_TIME. By default, it's 3600s.
#   It will randomly select color and powerline separator. Based on the selected color, it will set the background
#     wallpaper.

WALLPAPERS_DIR=$DOTTY_HOME/assets/wallpapers
CYCLE_TIME=${1:-3600}

# Kill running run.sh script, use /$$/ to exclude current run.sh script
declare -a run_script_pids
local ps_str=$(ps aux)
run_script_pids=($(echo ${ps_str} | grep -i "polybar/run.sh" | grep -v "grep" | tr -s ' ' | cut -d' ' -f2))
if [[ -n "${run_script_pids[@]/$$/}" ]]; then kill -9 ${run_script_pids[@]/$$/}; fi

# Calculate MONITOR and DPI
MONITOR=$(xrandr -q | grep primary | grep ' connected' | cut -d' ' -f1)
declare -xr MONITORS=($(xrandr -q | grep ' connected' | cut -d' ' -f1))
declare -x MONITOR=${MONITOR:-${MONITORS[1]}}
readonly MONITOR

# Reload bspwm monitor setting
if _is_running bspwm; then
  bspc monitor $MONITOR -d {1,2,3,4,5,6}
  for mon in ${MONITORS[@]/${MONITOR}/}; do
    bspc monitor $mon -d {1,2,3,4}
  done
fi

declare -x DPI
if [ "$GDK_SCALE" -eq 2 ]; then
  DPI=160
else
  DPI=92
fi
readonly DPI

pushd ~ >/dev/null

declare -a colors separators
colors=("${(@f)$(ls ${0:A:h}/resources/colors)}")
separators=("${(@f)$(ls ${0:A:h}/resources/separators)}")

while true; do
  killall -q polybar

  # Random select color and powerline separator
  selected_color=${colors[$(($RANDOM % ${#colors[@]} + 1))]}
  source ${0:A:h}/resources/colors/${selected_color}
  selected_separator=${separators[$(($RANDOM % ${#separators[@]} + 1))]}
  source ${0:A:h}/resources/separators/${selected_separator}
  
  # Set wallpaper based on selected_color
  declare -a color_wallpapers
  local selected_wallpaper

  color_wallpapers=("${(@f)$(ls ${WALLPAPERS_DIR} | grep -i ${selected_color} | grep -v "\-${selected_color}")}")
  if [ -z "${color_wallpapers}" ]; then
    # Fallback to the first wallpaper available if no wallpapers with matched color found.
    local wallpapers=("${(@f)$(ls ${WALLPAPERS_DIR})}")
    selected_wallpaper=${wallpapers[0]}
  else
    selected_wallpaper=${color_wallpapers[$(($RANDOM % ${#color_wallpapers[@]} + 1))]}
  fi

  _call feh --bg-fill --no-fehbg --image-bg black ${WALLPAPERS_DIR}/${selected_wallpaper} &

  # Set bspwm color
  _call bspc config focused_border_color ${shade3}
  _call bspc config presel_feedback_color ${shade3}

  # Reload polybar
  while _is_running polybar; do sleep 0.3; done
  polybar main >$XDG_DATA_HOME/polybar.log 2>&1 &

  declare -x SIDE_MONITOR
  for SIDE_MONITOR in ${MONITORS[@]/${MONITOR}/}; do
    polybar side >>$XDG_DATA_HOME/polybar.log 2>&1 &
  done

  sleep ${CYCLE_TIME}
done

popd >/dev/null

echo "Polybar launched..."
