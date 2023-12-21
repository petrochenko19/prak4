# Використання образу scratch як базового образу
FROM scratch

# Визначення аргументу APP_NAME та його значення за замовчуванням
ARG APP_NAME=my-app
ENV APP_NAME=${APP_NAME}

# Створення робочої директорії
WORKDIR /app

# Копіювання скомпільованої програми до робочої директорії контейнера використовуючи змінну аргументу APP_NAME як вихідне імʼя файлу. В контейнері імʼя файлу повинно бути 'main'
COPY ${APP_NAME} /app/main

# Вказати, що контейнер слухатиме на порту 8080 (якщо це необхідно)
EXPOSE 8080

# Команда для запуску додатку при старті контейнера з робочої директорії
CMD ["./main"]
