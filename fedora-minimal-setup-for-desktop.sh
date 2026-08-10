sudo dnf install -y kernel-modules kernel-modules-extra @networkmanager-submodules NetworkManager-tui NetworkManager kernel-headers linux-firmware alsa-firmware alsa-utils alsa-sof-firmware mesa-dri-drivers mesa-vulkan-drivers pipewire pipewire-alsa pipewire-pulseaudio wireplumber libinput
sudo systemctl set-default graphical.target
systemctl enable --user --now pipewire.socket pipewire-pulse.socket wireplumber pipewire pipewire-pulse

read -p "Do you want to install a Desktop Environment? ([Y]/n) "$'\n' -n 1 -r
echo '-> '
REPLY=${REPLY:-y}
if [[ $REPLY =~ ^[Yy]$ ]]
then
  while true; do
    read -p "Enter 1 for GNOME or 2 for KDE: " choice
    case "$choice" in
        1)
            sudo dnf install -y @gnome-desktop power-profiles-daemon
            sudo systemctl enable power-profiles-daemon
            sudo systemctl enable gdm --force
            break
            ;;
        2)
            sudo dnf install -y @kde-desktop power-profiles-daemon
            sudo systemctl enable power-profiles-daemon
            sudo systemctl enable plasma-login --force
            break
            ;;
        *)
            echo "Invalid number. Please try again."
            ;;
    esac
  done
fi
echo 'The system will reboot in 3 seconds.'
echo '3...'
sleep 1
echo '2..'
sleep 1
echo '1.'
sleep 1
sudo rm -rf ~/scripts && sudo reboot
