# timezone
timedatectl set-timezone UTC &&

#apt
apt update &&
apt upgrade &&
apt install -y make &&
apt install -y git && 

#ssh
cat /root/dv0vd.xyz/deployment/configs/linux/ssh.pub >> /root/.ssh/authorized_keys &&
echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config &&
echo Port $SSH_PORT >> /etc/ssh/sshd_config &&

# fail2ban
# apt install fail2ban -y &&
# cat /root/dv0vd.xyz/deployment/configs/fail2ban/jail.local >> /etc/fail2ban/jail.local &&
# cat /root/dv0vd.xyz/deployment/configs/fail2ban/fail2ban.local >> /etc/fail2ban/fail2ban.local &&
# systemctl enable fail2ban &&
# systemctl start fail2ban &&

#podman
apt install podman -y && 
systemctl enable podman &&
systemctl start podman &&
podman system prune --all -f &&
rm /etc/rc.local -f &&
touch /etc/rc.local &&
echo '#!/bin/bash' >> /etc/rc.local &&
echo 'cd /root' >> /etc/rc.local &&
echo 'make restart-containers' >> /etc/rc.local &&
echo 'make schedule-midnight-reboot' >> /etc/rc.local &&
echo 'exit 0' >> /etc/rc.local &&
chmod a+x /etc/rc.local &&

reboot

