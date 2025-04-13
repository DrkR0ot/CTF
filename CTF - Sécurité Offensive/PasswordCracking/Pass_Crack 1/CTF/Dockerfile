FROM ctf:base
ARG SSH_PASS
ARG FLAG

# On copie les fichiers locaux dans le CTF 
COPY passwords.list /home/ctf
COPY Fichier_Sensible.zip /home/ctf

# On vient donner le MDP a l'utilisateur CTF
RUN echo "ctf:${SSH_PASS}" | chpasswd

# On MaJ la machine et télécharger qque package nécessaire au chall
RUN apt-get update && apt-get install -y zip pandoc hashcat git

# On fait en sort que le certificat du site web ne pose pas de problème lors du téléchargement 
RUN echo "$(timeout 2 openssl s_client -showcerts -connect github.com:443)" | grep -zoPe '-----BEGIN CERTIFICATE-----[a-zA-Z0-9\/\n+=]+-----END CERTIFICATE-----\n' > /tmp/zscaler.crt && sed 's/\x0//g' /tmp/zscaler.crt > /usr/local/share/ca-certificates/zscaler.crt && rm /tmp/zscaler.crt && update-ca-certificates 
WORKDIR /usr/share/
RUN git clone https://github.com/openwall/john.git \
&& mv john john_build \
&& cd john_build/src \
&& ./configure --without-openssl \
&& make -s clean && make -sj4 \
&& echo 'export PATH=/usr/share/john_build/run:$PATH' >> /home/ctf/.bashrc \
&& echo "alias john='/usr/share/john_build/run/john'" >> /home/ctf/.bashrc \
&& echo "while true; do echo '' > /usr/share/john_build/run/john.pot 2>/dev/null; echo '' > /usr/share/john_build/run/john.log 2>/dev/null; sleep 2; done &" >> /home/ctf/.bashrc \
&& chown ctf:ctf /usr/share/john_build/run/ \
&& chmod 555 /home/ctf/Fichier_Sensible.zip \
&& chmod 555 /home/ctf/passwords.list \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd
