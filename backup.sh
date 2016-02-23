#!/bin/bash

DATE=`date +%Y-%m-%d`
echo $DATE
filename="fom2marco.$DATE.tar.gz"

cd /var/www/html/

tar -zcvf  $filename fom2marco
sudo chmod 777 $filename 
sudo mv $filename backup


rsync -r backup nicotra@192.168.100.254:/data/Nicotra


exit 0
