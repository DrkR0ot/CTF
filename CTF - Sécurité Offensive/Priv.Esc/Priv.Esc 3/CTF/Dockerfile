FROM ctf:base
ARG SSH_PASS
ARG FLAG

RUN echo "ctf:${SSH_PASS}" | chpasswd

# Création des utilisateurs 
RUN useradd -m -s /bin/bash user3 \
# Définition du répertoire personnel pour chaque utilisateur 
&& usermod -d /home/user3 user3 \
# Changement du propriétaire des répertoires personnels 
&& chown user3:user3 /home/user3 \
# Changement des permissions sur les répertoires personnels 
&& chmod 750 /home/user3 \
#Ajout des différents flags dans les home directory de nos 3 utilisateurs
&& echo $FLAG > /home/user3/flag3.txt \
&& chown root:user3 /home/user3/flag3.txt \
&& chmod 444 /home/user3/flag3.txt \
# Ajout de la vuln num 3 : Une tâche cron qui s'exécute avec les droits user3 run /etc/script.sh toutes les min.
# Sauf que /etc/script.sh exécute une commande dans un répertoire qui n'existe pas. Il va falloir que l'utilisateur créé le fichier et faire en sorte que le script run le 
# payload par lui meme
&& echo '#!/bin/bash\n\
cd /tmp/abcd\n\
tar -cf /dev/null /dev/null *\n\
sudo /bin/rm -rf /tmp/abcd/*' > /etc/script.sh && chown user3:user3 /etc/script.sh \
&& echo "user3   ALL=(ALL) NOPASSWD: /bin/rm -rf /tmp/abcd/*" >> /etc/sudoers \
# Donner les droits sur le script 
&& chmod 504 /etc/script.sh \
# Créer la tâche cron qui exécute le script.sh toutes les min
&& echo "*/1 * * * * user3 /etc/script.sh" > /etc/crontab \
# Suppresion de bash history
&& ln -s /dev/null /home/user3/.bash_history \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd
