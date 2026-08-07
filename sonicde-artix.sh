curl -O https://sonicde-artix.github.io/sonicde-artixlinux.asc
sudo pacman-key --add sonicde-artixlinux.asc
sudo pacman-key --finger 72AAA51726BC3C29
sudo pacman-key --lsign-key 72AAA51726BC3C29
echo '[sonicde]
Server = https://sonicde-artix.github.io/$arch' | sudo tee -a /etc/pacman.conf
sudo pacman -Syu sonicde-meta
