FROM ctf:base
ARG SSH_PASS
ARG FLAG

COPY passwords.list /home/ctf
COPY rules.list /home/ctf

RUN echo "ctf:${SSH_PASS}" | chpasswd
RUN apt-get update && apt-get install -y zip p7zip pandoc git curl wget hashcat
RUN echo "deb http://http.kali.org/kali kali-rolling main contrib non-free non-free-firmware" | sudo tee /etc/apt/sources.list 
WORKDIR /etc/apt/trusted.gpg.d 
RUN wget --no-check-certificate https://http.kali.org/kali/pool/main/k/kali-archive-keyring/kali-archive-keyring_2022.1_all.deb \
&& dpkg -i kali-archive-keyring_2022.1_all.deb 
RUN apt-get update && apt-get install -y john 

RUN mkdir -p /home/ctf/.local/share/hashcat/sessions/ \
&& echo "ctf ALL=(ALL:ALL) NOPASSWD:/usr/bin/hashcat" >> /etc/sudoers \
&& echo "ctf ALL=(ALL:ALL) NOPASSWD:/usr/sbin/john" >> /etc/sudoers \
&& echo 'export PATH=/usr/sbin:$PATH' >> /home/ctf/.bashrc \
&& echo "while true; do echo '' > /root/.john/john.pot 2>/dev/null; echo '' > /root/.john/john.log 2>/dev/null; sleep 2; done &" >> /home/ctf/.bashrc \
&& mkdir /home/ctf/.john \ 
&& mkdir /root/.john \
&& touch /root/.john/john.log \
&& touch /root/.john/john.pot \
&& chmod -R 733 /root \
&& chown -R ctf /root/.john/ \
&& echo "Flag_Mut@Ti0n_d3_P@ssw0rd" > /home/ctf/Flag.txt \
&& zip --password 123456789! /home/ctf/Flag.zip /home/ctf/Flag.txt \
&& rm /home/ctf/Flag.txt \
&& chmod 555 /home/ctf/Flag.zip \
&& chmod 555 /home/ctf/*.list \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd
