FROM kalilinux/kali-rolling

RUN apt -y update && apt -y upgrade
RUN apt install -y zsh zsh-syntax-highlighting zsh-autosuggestions --no-install-recommends
RUN apt install -y iproute2 --no-install-recommends
RUN apt install -y nmap sqlmap metasploit-framework --no-install-recommends

ENTRYPOINT ["/bin/zsh"]
