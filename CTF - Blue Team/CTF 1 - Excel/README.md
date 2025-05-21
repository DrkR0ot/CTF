# 🛡️ Blue Team: CTF 1 – Excel Challenge

## 📘 Challenge Instructions

### 🧠 Context

You are working on an **isolated PC**. You are free to run anything on this machine, but **you do not have internet access**. In other words, do not rely on any external tools.

The goal of this challenge is to improve your skills in using **native Windows tools**, especially **PowerShell**.

---

## 🔧 Steps to Follow

### 🗂️ 1. Script Installation

- Upload the following files to a **shared network folder** accessible to all participants:
  - `Script.ps1`
  - `Anonymous.jpg`
  - `Popup.cmd`

- Edit the **macro** in the Excel file:
  - Open the macro editor via `Alt+F11`
  - The macro is encoded in Base64 — update it with your custom payload  
  - ⚠ **Warning**: The new command must be **obfuscated using PowerShell**, not external tools like **CyberChef**, due to encoding compatibility.  
    You can use my **Windows Obfuscation Tool** if needed.

- Update the file path in `Script.ps1` to reflect the new location.

---

### 🖥️ 2. Copy the CTF to Your Desktop

- Download and place the Excel file **directly on your desktop**.

---

### 📁 3. Open File Explorer

- Navigate to the location where you placed the Excel file.

---

### 🔓 4. Unblock the File (if necessary)

- Right-click the file  
- Select **Properties**  
- At the bottom of the window, in the **Security** section, check **Unblock**  
  *(If a GPO blocks execution, this step may be required)*

---

### 🚀 5. Launch the CTF

- Open the Excel file  
- Enable macros when prompted  
- Start the challenge!

---

## 🎉 Note

Have fun and good luck!
