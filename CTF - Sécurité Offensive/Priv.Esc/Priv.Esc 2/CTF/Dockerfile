FROM ctf:base
ARG SSH_PASS
ARG FLAG

RUN echo "ctf:${SSH_PASS}" | chpasswd

# Création des utilisateurs 
RUN useradd -m -s /bin/bash user2 \
# Définition du répertoire personnel pour chaque utilisateur 
&& usermod -d /home/user2 user2 \ 
# Changement du propriétaire des répertoires personnels 
&& chown user2:user2 /home/user2 \
# Changement des permissions sur les répertoires personnels 
&& chmod 750 /home/user2 \
#Ajout des différents flags dans les home directory de nos 3 utilisateurs
&& echo $FLAG > /home/user2/flag2.txt \
&& chown root:user2 /home/user2/flag2.txt \
&& chmod 444 /home/user2/flag2.txt \
# Ajout de la vuln num 2 : SUID de user2 sur le binaire find. En se référant a GTFOBins, on peut faire une PE et devenir user2
&& chown user2:user2 /bin/find && chmod u+s /bin/find \
# Suppresion de bash history
&& ln -s /dev/null /home/user2/.bash_history \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd

