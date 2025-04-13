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
&& mkdir /home/ctf/.john \ 
&& mkdir /root/.john \
&& touch /root/.john/john.log \
&& touch /root/.john/john.pot \
&& chmod -R 733 /root \
&& chown -R ctf /root/.john/ \
&& echo "ctf ALL=(ALL:ALL) NOPASSWD:/usr/bin/hashcat" >> /etc/sudoers \
&& echo "ctf ALL=(ALL:ALL) NOPASSWD:/usr/sbin/john" >> /etc/sudoers \
&& echo 'export PATH=/usr/sbin:$PATH' >> /home/ctf/.bashrc \
&& echo "while true; do echo '' > /root/.john/john.pot 2>/dev/null; echo '' > /root/.john/john.log 2>/dev/null; sleep 2; done &" >> /home/ctf/.bashrc \
&& useradd -m -s /bin/bash Maltazard \
&& chown Maltazard:Maltazard /home/Maltazard \
&& chmod 700 /home/Maltazard \
&& head -n -3 /etc/ssh/sshd_config > tmp.txt && mv tmp.txt /etc/ssh/sshd_config \
&& echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config \
&& mkdir /home/Maltazard/.ssh/ \
#&& openssl genrsa -aes128 -passout pass:B@tm@n1 -out /home/Maltazard/.ssh/id_rsa 2048 \
&& ssh-keygen -t rsa -P B@tm@n1 -f /home/Maltazard/.ssh/id_rsa \
#&& ssh-keygen -f /home/Maltazard/.ssh/id_rsa -y -P B@tm@n1 > /home/Maltazard/.ssh/id_rsa.pub \
&& cat /home/Maltazard/.ssh/id_rsa.pub > /home/Maltazard/.ssh/authorized_keys \
&& echo $FLAG > /home/Maltazard/flag.txt \
&& echo -e "Bob... Si tu lis ce document, c'est qu'il est déjà trop tard... \nVoici ce que je cachais depuis tant d'années. \
Elle te permettra de devenir... Une autre personne. \nUne personne dont on ne prononce pas le nom...\n \
Crains par tous. Fais attention. \nIl s'agit de M. \n" > /home/ctf/NE_PAS_OUVRIR.txt \
&& cat /home/Maltazard/.ssh/id_rsa >> /home/ctf/NE_PAS_OUVRIR.txt \
&& pandoc /home/ctf/NE_PAS_OUVRIR.txt -o /home/ctf/NE_PAS_OUVRIR.docx \
&& zip --password m@dison2021! /home/ctf/NE_JAMAIS_OUVRIR.zip /home/ctf/NE_PAS_OUVRIR.docx \
&& rm /home/ctf/NE_PAS_OUVRIR.docx \
&& rm /home/ctf/NE_PAS_OUVRIR.txt \
&& chmod 555 /home/ctf/*.list \
&& chmod 555 /home/ctf/NE_JAMAIS_OUVRIR.zip \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd
