# Blue Team : CTF 1 - Excel

## Instructions pour le CTF

### Contexte
Vous êtes sur un PC isolé. Vous pouvez lancer ce que vous voulez sur cette machine, **mais vous n'avez pas accès à Internet**. Autrement dit, **n'utilisez pas d'outils externes**.  
Le but de ce challenge est de progresser dans l'utilisation des outils natifs de Windows, tels que **PowerShell**.

---

### Étapes à suivre

1. **Installation des scripts**
    1. Coller les fichiers : Script.ps1, Anonymous.jpg et Popup.cmd sur un serveur de fichiers accessible à tous les participants.
    2. Modifier la macro (Alt+F11) du fichier Excel qui est encodée en Base64 pour l'adapter (Warning : Il faut obfusquer votre nouvelle commande a l'aide de Powershell et non d'un outil tierce style CyberChef pour des problème de compatibilité, vous pouvez utiliser mon outil d'Obfuscsation Windows au besoin). 
    3. Modifier le chemin dans le fichier Script.ps1 pour l'adapter.
    
2. **Copier le CTF sur votre bureau**  
   Téléchargez et copiez le fichier Excel directement sur votre bureau.
    
3. **Ouvrir l'explorateur de fichiers**  
   Accédez à l'emplacement où vous avez collé le fichier Excel.

4. **Débloquer le fichier** *(si nécessaire)*  
   - Cliquez avec le bouton droit de votre souris sur le fichier.
   - Sélectionnez **Propriétés**.
   - En bas de la fenêtre, dans la section **Sécurité**, cochez l'option **Débloquer** (si une GPO bloque l'exécution).

5. **Lancer le CTF**  
   Ouvrez le fichier Excel en activant les macros pour commencer le challenge.

---

### Remarque
Amusez-vous bien ! 🎉
