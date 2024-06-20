wget https://iperf.fr/download/iperf_3.10.1/iperf3-3.10.1-static-x86_64.tar.gz
tar -xzvf iperf3-3.10.1-static-x86_64.tar.gz
mv iperf3 /usr/local/bin/
chmod +x /usr/local/bin/iperf3
/usr/local/bin/iperf3 --version
