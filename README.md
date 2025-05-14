# Bash-скрипт для создания нового пользователя с доступом по SSH

![Bash](https://img.shields.io/badge/-Bash-4EAA25?logo=gnu-bash&logoColor=white) ![Linux](https://img.shields.io/badge/-Linux-FCC624?logo=linux&logoColor=black) ![SSH](https://img.shields.io/badge/-SSH-67A1D6?logo=ssh&logoColor=white)

> Этот Bash-скрипт автоматизирует процесс создания нового пользователя на Linux-системе, настройки аутентификации по паролю, предоставления прав `sudo` без ввода пароля и настройки доступа через SSH с использованием ключей.

## 🚀 Возможности

- 🛠 **Создание пользователя**: Автоматически создает нового пользователя с домашней директорией и назначает ему стандартную оболочку (`/bin/bash`)
- 🔑 **Настройка пароля**: Считывает имя пользователя и пароль из файла (`user_credentials.txt`)
- ⚡ **Права sudo**: Добавляет пользователя в группу `sudo` без необходимости ввода пароля
- 🔒 **Настройка SSH**: Копирует публичный SSH-ключ (`ssh_key.pub`) для безопасного доступа
- 🛡 **Доп. безопасность**: Опциональное отключение аутентификации по паролю через SSH

## 📋 Требования

1. **Linux-система** (Ubuntu, Debian, CentOS и т.д.)
2. **Права администратора** (требуются права `sudo`)
3. **Необходимые файлы**:
   - `user_credentials.txt` - файл с учетными данными в формате:
     ```text
     username password
     ```
   - `ssh_key.pub` - публичный SSH-ключ

## 🛠 Установка и использование

1. Подготовьте необходимые файлы
2. Сделайте скрипт исполняемым:
   ```bash
   chmod +x script_name.sh
   ```
3. Запустите скрипт:
   ```bash
   ./script_name.sh
   ```
4. Для опционального отключения аутентификации по паролю раскомментируйте:
   ```bash
   # sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
   # sudo systemctl restart ssh
   ```

## ⚠️ Примечания

- 🔐 **Безопасность**: Всегда используйте SSH-ключи вместо паролей
- ↩️ **Откат изменений**: Для удаления пользователя:
  ```bash
  sudo deluser --remove-home username
  ```
- 📜 **Логирование**: Скрипт выводит подробные сообщения о ходе выполнения

## 📜 Лицензия

Этот проект распространяется под лицензией MIT. См. файл [LICENSE](LICENSE) для подробностей.

---

<p align="center">
  <img src="https://img.shields.io/github/last-commit/username/repo?style=for-the-badge" alt="Last commit">
  <img src="https://img.shields.io/github/license/username/repo?style=for-the-badge" alt="License">
</p>

<p align="center">
  Создано с ❤️ для удобства администрирования Linux-серверов
</p>
