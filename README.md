<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bash-скрипт для создания нового пользователя с доступом по SSH</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            line-height: 1.6;
            color: #333;
            max-width: 900px;
            margin: 0 auto;
            padding: 20px;
            background-color: #f9f9f9;
        }
        
        h1, h2 {
            color: #2c3e50;
        }
        
        h1 {
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
            text-align: center;
        }
        
        h2 {
            border-left: 4px solid #3498db;
            padding-left: 10px;
            margin-top: 30px;
        }
        
        code {
            background-color: #f0f0f0;
            padding: 2px 5px;
            border-radius: 3px;
            font-family: 'Courier New', Courier, monospace;
        }
        
        pre {
            background-color: #282c34;
            color: #abb2bf;
            padding: 15px;
            border-radius: 5px;
            overflow-x: auto;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .note {
            background-color: #e7f5fe;
            border-left: 4px solid #3498db;
            padding: 15px;
            margin: 20px 0;
            border-radius: 0 3px 3px 0;
        }
        
        .warning {
            background-color: #fff3e0;
            border-left: 4px solid #ffa726;
            padding: 15px;
            margin: 20px 0;
            border-radius: 0 3px 3px 0;
        }
        
        .feature-list {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 15px;
            margin: 20px 0;
        }
        
        .feature {
            background-color: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
        }
        
        .feature h3 {
            margin-top: 0;
            color: #3498db;
        }
        
        footer {
            margin-top: 40px;
            text-align: center;
            font-size: 0.9em;
            color: #7f8c8d;
        }
    </style>
</head>
<body>
    <h1>Bash-скрипт для создания нового пользователя с доступом по SSH</h1>

    <div class="note">
        <p>Этот Bash-скрипт автоматизирует процесс создания нового пользователя на Linux-системе, настройки аутентификации по паролю, предоставления прав <code>sudo</code> без ввода пароля и настройки доступа через SSH с использованием ключей. Он создан для упрощения развертывания новых пользователей в серверных средах.</p>
    </div>

    <h2>Возможности</h2>
    
    <div class="feature-list">
        <div class="feature">
            <h3>Создание пользователя</h3>
            <p>Автоматически создает нового пользователя с домашней директорией и назначает ему стандартную оболочку (<code>/bin/bash</code>).</p>
        </div>
        
        <div class="feature">
            <h3>Настройка пароля</h3>
            <p>Считывает имя пользователя и пароль из файла (<code>user_credentials.txt</code>) и устанавливает их для нового пользователя.</p>
        </div>
        
        <div class="feature">
            <h3>Права sudo</h3>
            <p>Добавляет пользователя в группу <code>sudo</code> и настраивает возможность выполнения команд без ввода пароля.</p>
        </div>
        
        <div class="feature">
            <h3>Настройка SSH</h3>
            <p>Копирует публичный SSH-ключ (<code>ssh_key.pub</code>) в файл <code>.ssh/authorized_keys</code> пользователя для безопасного доступа по SSH.</p>
        </div>
        
        <div class="feature">
            <h3>Дополнительные меры безопасности</h3>
            <p>Включает закомментированный код для отключения аутентификации по паролю через SSH (по желанию).</p>
        </div>
    </div>

    <h2>Требования</h2>
    
    <p>Перед запуском скрипта убедитесь, что выполнены следующие условия:</p>
    
    <ol>
        <li><strong>Linux-окружение</strong>: Скрипт предназначен для использования на Linux-системах (например, Ubuntu, Debian, CentOS).</li>
        <li><strong>Права администратора</strong>: Для работы скрипта требуются права <code>sudo</code>, так как он выполняет операции по созданию пользователей, изменению системных файлов и настройке SSH.</li>
        <li><strong>Необходимые файлы</strong>:
            <ul>
                <li><code>user_credentials.txt</code>: Текстовый файл, содержащий имя пользователя и пароль в формате:
                    <pre>username password</pre>
                </li>
                <li><code>ssh_key.pub</code>: Файл с публичным SSH-ключом, который будет использоваться для доступа к системе.</li>
            </ul>
        </li>
    </ol>

    <h2>Инструкция по использованию</h2>
    
    <ol>
        <li><strong>Подготовка файлов</strong>:
            <ul>
                <li>Создайте файл <code>user_credentials.txt</code> и добавьте в него имя пользователя и пароль, разделив их пробелом.</li>
                <li>Убедитесь, что у вас есть публичный SSH-ключ в файле <code>ssh_key.pub</code>
