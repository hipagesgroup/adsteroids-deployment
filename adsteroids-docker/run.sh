cd /root/adsteroids-microservice && nohup npm start &> /tmp/microservice &
cd /root/adsteroids-microapp && nohup npm start &> /tmp/microapp &
tail -f /tmp/microservice /tmp/microapp
