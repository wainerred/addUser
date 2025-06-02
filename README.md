
# Bash Script for Creating a New User with SSH Access

![Bash](https://img.shields.io/badge/-Bash-4EAA25?logo=gnu-bash&logoColor=white) ![Linux](https://img.shields.io/badge/-Linux-FCC624?logo=linux&logoColor=black) ![SSH](https://img.shields.io/badge/-SSH-67A1D6?logo=ssh&logoColor=white)

> This Bash script automates the process of creating a new user on a Linux system, setting up password authentication, granting passwordless `sudo` privileges, and configuring SSH key-based access.

## 🚀 Features

- 🛠 **User Creation**: Automatically creates a new user with home directory and assigns `/bin/bash` as default shell
- 🔑 **Password Setup**: Reads username and password from `user_credentials.txt` file
- ⚡ **Sudo Privileges**: Adds user to `sudo` group without password prompt requirement
- 🔒 **SSH Setup**: Copies public SSH key (`ssh_key.pub`) for secure access
- 🛡 **Enhanced Security**: Optional disabling of password authentication for SSH

## 📋 Requirements

1. **Linux system** (Ubuntu, Debian, CentOS, etc.)
2. **Administrative privileges** (sudo rights required)
3. **Required files**:
   - `user_credentials.txt` - credentials file in format:
     ```text
     username password
     ```
   - `ssh_key.pub` - public SSH key

## 🛠 Installation & Usage

1. Prepare the required files
2. Make the script executable:
   ```bash
   chmod +x create_user.sh
   ```
3. Run the script:
   ```bash
   ./create_user.sh
   ```
4. To optionally disable password authentication, uncomment:
   ```bash
   # sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
   # sudo systemctl restart ssh
   ```

## ⚠️ Notes

- 🔐 **Security**: Always prefer SSH keys over password authentication
- ↩️ **Revert Changes**: To remove a user:
  ```bash
   sudo deluser --remove-home username
   ```
- 📜 **Logging**: The script provides detailed output about execution progress

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

---

<p align="center">
  <img src="https://img.shields.io/github/last-commit/username/repo?style=for-the-badge" alt="Last commit">
  <img src="https://img.shields.io/github/license/username/repo?style=for-the-badge" alt="License">
</p>

<p align="center">
  Created with ❤️ for easier Linux server administration
</p>



