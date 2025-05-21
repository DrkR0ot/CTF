### 🔍 Analysis Steps

**Step 1:** Locate the Excel macro (use `Alt+F11` to open the macro editor)

**Step 2:** Deobfuscate the Base64-encoded macro

**Step 3:** Analyze the macro's behavior  
This macro copies the file `Script.ps1` from the shared file server to the **desktop** of the user who runs the macro.

**Step 4:** Analyze the contents of `Script.ps1`, which was copied to the user's desktop with the **hidden attribute**  
Upon execution, `Script.ps1` does the following:
- Opens WordPad and writes content into it
- Copies the file `Popup.cmd` to the user's **Start Menu Startup folder**, establishing **persistence** on the machine

**Step 5:** Delete the `Popup.cmd` file from the user's Start Menu Startup folder

**Step 6:** Delete the `Script.ps1` file from the desktop
