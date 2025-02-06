exec dwm
xrandr --output eDP-1 --primary --auto --output HDMI-1-0 --auto --right-of eDP-1
picom &
feh --bg-scale ~/Pictures/Wallpaper/017.jpg
setxkbmap -layout "us,ara" -option "grp:win_space_toggle"
xinput set-prop "ELAN06FA:00 04F3:31AD Touchpad" "libinput Tapping Enabled" 1 

xmodmap ~/.Xmodmap
xset r rate 280 45
