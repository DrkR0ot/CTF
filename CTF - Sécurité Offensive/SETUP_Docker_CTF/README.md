# 🛠️ Running CTF Challenges Locally with Docker

If you want to reproduce the CTF challenges locally using Docker containers, please follow the steps below:

---

## 🧩 Step 1: Install Docker and Docker Compose

Before creating or running any challenge, make sure **Docker** and **Docker Compose** are installed on your machine.  
For Windows users, it is highly recommended to install **Docker Desktop**, which includes everything you need.

---

## 🧱 Step 2: Build the Base Image

Once Docker is installed, navigate to the following directory:

```bash
SETUP_Docker_CTF/Docker_base
```
Then run the following command to build the base image that will be used across future challenges:
```bash
docker-compose build
```

✅ This step is essential to prepare the common environment on which all your CTF scenarios will be based.

---
