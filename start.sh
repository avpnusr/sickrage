#! /bin/sh
echo "### Bringing up crond for daily update of database ###"
/usr/sbin/crond -b
echo ""
echo ""
echo "### Starting SickRage v2018.09.17-1 ###"
/usr/bin/python /sickrage/SickBeard.py --nolaunch --datadir=/data --config=/data/config.ini 
