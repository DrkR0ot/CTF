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
&& chmod 700 /home/user1 \
#Ajout des différents flags dans les home directory de nos 3 utilisateurs
&& echo $FLAG > /root/flag_bonus.txt \
&& echo "Ok, et maintenant ? Tu as pensé a regarder les permissions sur certains fichiers ? Et les commandes que ce user peut faire ?" > /home/user1/flag_indice.txt \
# Ajout de la vuln num 1 : tous les users peuvent exécuter /bin/bash avec les droits user1
&& echo "ALL ALL=(user1) NOPASSWD: /bin/bash " >> /etc/sudoers \
# Ajout de la vuln bonus : tous les users peuvent exécuter /bin/cp avec les droits de user1. 
# L'objectif est de remplacer le /etc/passwd existant et de venir mettre notre utilisateur 
# avec le même ID que root puis switch dessus. La difficulté est que l'on vient supprimer la 1iere ligne de /etc/passwd
# Il va falloir se renseigner sur le fonctionnement de /etc/passwd pour mettre le même id que root
# a notre utilisateur 
# On autorise tout le monde a utiliser /bin/cp avec les droits user1
&& echo "ALL ALL=(user1) NOPASSWD: /bin/cp" >> /etc/sudoers \
# On ajoute user1 en tant que propriétaire de /etc/passwd
&& chown user1 /etc/passwd \
# On donne au propriétaire de /etc/passwd le droit d'écriture mais pas de lecture -> évite les éditions graphiques 
# et force echo ou cp
&& chmod 244 /etc/passwd \
# On supprime la première ligne de /etc/passwd qui correspond a root pour forcer les challenger a cherché comment le devenir
&& sudo sed -i '1d' /etc/passwd \
# Suppresion de bash history
&& ln -s /dev/null /home/user1/.bash_history \
&& rm /usr/bin/passwd \
&& rm /usr/sbin/chpasswd
