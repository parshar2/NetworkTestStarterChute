#!/bin/bash

# Start the web server.  Its static files are located in /usr/share/nginx/html/
# if you want to change the content.
/etc/init.d/nginx start
rm /usr/share/nginx/html/iperf.html

# You can implement logic here to do periodic network tests and save the
# results.  You can do that directly from this bash script or call another
# program that you write (e.g. in Python).
while true; do
    rm /usr/share/nginx/html/iperf.html
    echo "----------------New Test --------------<br>" >> /usr/share/nginx/html/iperf.html
    echo "--------------- Running iperf for bandwidth measurement<br>" >> /usr/share/nginx/html/iperf.html
    iperf -c iperf.wiscnet.net -i2 >> /usr/share/nginx/html/iperf.html
    echo "----------------Pinging google --------<br>" >> /usr/share/nginx/html/iperf.html
    ping www.google.com -c 5 >> /usr/share/nginx/html/iperf.html

    sleep 60
done

# If execution reaches this point, the chute will stop running.
exit 0
