FROM kalilinux/kali

RUN apt-get update && \
apt-get upgrade && \
apt-get install -y zsh zsh-syntax-highlighting zsh-autosuggestions iproute2 --no-install-recommends

RUN apt-get install -y kali-linux-core --no-install-recommends

ENTRYPOINT ["/bin/zsh"]


