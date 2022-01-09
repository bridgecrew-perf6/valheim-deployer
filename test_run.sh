source user_data.cfg

echo $worldname

if [ ! -f base_run.txt ]; then
    echo "File not found! $server_name"
fi
#
(sudo su -c "EDITOR='tee' visudo -f /etc/sudoers.d/$server_name")  << EOL
steam ALL=NOPASSWD:/usr/bin/systemctl start $server_name.service
steam ALL=NOPASSWD:/usr/bin/systemctl stop $server_name.service
steam ALL=NOPASSWD:/usr/bin/systemctl restart $server_name.service
steam ALL=NOPASSWD:/usr/bin/systemctl status $server_name.service
EOL

#