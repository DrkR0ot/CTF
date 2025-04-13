# 🛠️ Reproduire les challenges en local avec Docker

Si vous souhaitez reproduire les challenges CTF en local à l’aide des conteneurs Docker, veuillez suivre les étapes ci-dessous :
## Etape 1 : Installer Docker et Docker Compose**
Avant de créer un challenge, assurez-vous d’avoir Docker et Docker Compose installés sur votre machine.
Pour les utilisateurs Windows, il est fortement recommandé d’installer Docker Desktop, qui inclut tout le nécessaire.

## Etape 2 : Créer l’image de base
Une fois l’installation terminée, rendez-vous dans le répertoire suivant :
```bash
SETUP_Docker_CTF/base

Puis exécutez la commande suivante pour construire l’image de base utilisée par les futurs challenges :
```bash
docker-compose build

✅ Cette étape est essentielle pour préparer l’environnement commun sur lequel s’appuieront vos futurs scénarios CTF.
