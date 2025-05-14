#!/bin/bash

# Проверка наличия необходимых файлов
if [[ ! -f "user_credentials.txt" || ! -f "ssh_key.pub" ]]; then
    echo "Ошибка: Файл user_credentials.txt или ssh_key.pub не найден в текущей директории."
    exit 1
fi

# Чтение логина и пароля из файла
read -r username password < user_credentials.txt

# Проверка, что пользователь не существует
if id "$username" &>/dev/null; then
    echo "Пользователь $username уже существует."
    exit 1
fi

# Создание пользователя
sudo useradd -m -s /bin/bash "$username"
echo "$username:$password" | sudo chpasswd

# Добавление пользователя в группу sudo и настройка без пароля
sudo usermod -aG sudo "$username"
echo "$username ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/"$username" > /dev/null

# Настройка SSH-доступа
ssh_dir="/home/$username/.ssh"
sudo mkdir -p "$ssh_dir"
sudo cp ssh_key.pub "$ssh_dir/authorized_keys"
sudo chown -R "$username:$username" "$ssh_dir"
sudo chmod 700 "$ssh_dir"
sudo chmod 600 "$ssh_dir/authorized_keys"

# Отключение аутентификации по паролю для SSH (опционально)
# Если нужно отключить вход по паролю для всех пользователей:
# sudo sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
# sudo systemctl restart ssh

echo "Пользователь $username успешно создан."
echo "SSH-ключ добавлен. Доступ по SSH настроен."
