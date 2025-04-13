# 🔁 CTF - Mutation de mots de passe : L’humain, ma faiblesse préférée

Les utilisateurs changent leur mot de passe… mais rarement leur logique.
Dans ce challenge, vous êtes confronté à une situation réaliste : vous avez un ancien mot de passe, et vous devez deviner ou craquer le nouveau à partir de mutations courantes.

🔐 Chiffres ajoutés, majuscules insérées, années modifiées, suffixes prévisibles… Les mauvaises habitudes sont souvent les meilleures amies des attaquants.
## 🧠 Objectif : comprendre et exploiter les schémas humains de modification de mot de passe pour accéder à un compte verrouillé.

## ❓ Pourquoi ce challenge ?

### Pour un attaquant
La mutation de mot de passe est une technique puissante :
- Elle permet de contourner les politiques de changement de mot de passe imposées par le système.
- Elle repose sur une connaissance du comportement utilisateur, et non sur la force brute seule.
- Elle est souvent plus rapide qu’une attaque classique, surtout avec un mot de passe de base connu.

### Pour une blue team
Ce type de scénario est un révélateur de vulnérabilités comportementales : 
- Eduquer les utilisateurs à ne pas recycler ou muter légèrement leurs mots de passe
- Mettre en place des systèmes qui détectent des mots de passe similaires à ceux précédemment utilisés
- Utiliser des solutions MFA (authentification à deux facteurs) pour limiter l’impact d’un mot de passe compromis

🎯 Un excellent challenge pour apprendre que, souvent, le plus grand risque ne vient pas de la machine… mais de l’humain.
