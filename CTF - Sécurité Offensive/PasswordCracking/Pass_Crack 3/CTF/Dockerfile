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

#Solution : 
# sudo hashcat passwords.list -r rules.list --stdout > /tmp/mut_passwords.list
# zip2john NE_JAMAIS_OUVRIR.zip > /tmp/zip4john
# sudo john zip4john -w=/tmp/mut_passwords.list
# unzip NE_JAMAIS_OUVRIR.zip -d /tmp/zip
# saisir le mot de passe
# pandoc /tmp/home/ctf/zip/NE_PAS_OUVRIR.docx -o NE_PAS_OUVRIR.txt
# Récupérer la clé privée ssh dans le message et la mettre dans un bon format car il y a des espaces automatiquement
# lors de la conversion de docx vers txt
# python3 /usr/share/ssh2john privatekey > id_rsa
# john id_rsa -w=/tmp/mut_passwords.list
# chmod 600 id_rsa
# ssh Maltazard@localhost -i id_rsa

#Hint 1:
# Qu'est ce que l'outil hashcat ?
#Hint 2 :
# Comment fonctionne hashcat pour générer une wordlist a partir d'une liste de règle ? 
# (attention de bien affichier le resultat dans une autre liste pour la réutiliser plus tard)
#Hint 3 :
# Comment fonctionne John The Ripper ainsi que ses autres fonctions en "2john" ?
#Hint 4 : 
# Comment ouvrir un fichier un fichier zip ?
#Hint 5 :
# Comment ouvrir un fichier docx sans interface graphique sur linux ? 
# Ou alors, comment convertir un fichier docx dans un autre format ?
#Hint 6 :
# comment se connecter sur une session ssh via une clé privée ?