FROM ctf:base
ARG SSH_PASS
ARG FLAG

RUN echo "ctf:${SSH_PASS}" | chpasswd

# Création des utilisateurs 
RUN useradd -m -s /bin/bash user1 \
# Définition du répertoire personnel pour chaque utilisateur 
&& usermod -d /home/user1 user1 \
# Changement du propriétaire des répertoires personnels 
&& chown user1:user1 /home/user1 \
# Changement des permissions sur les répertoires personnels 
&& chmod 750 /home/user1 \
#Ajout des différents flags dans les home directory de nos 3 utilisateurs
&& echo $FLAG > /home/user1/flag1.txt \
&& chown root:user1 /home/user1/flag1.txt \
&& chmod 444 /home/user1/flag1.txt \
# Ajout de la vuln num 1 : tous les users peuvent exécuter /bin/bash avec les droits user1
&& echo "ALL ALL=(user1) NOPASSWD: /bin/bash " >> /etc/sudoers \
# Suppresion de bash history
&& ln -s /dev/null /home/user1/.bash_history \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd
