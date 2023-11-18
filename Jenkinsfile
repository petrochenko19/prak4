pipeline {
    agent {
        // Необхідно для роботи в плейграунді
        label 'agent-node-label'
    }

    environment {
        // Поміняйте APP_NAME та DOCKER_IMAGE_NAME на ваше імʼя та прізвище, відповідно.
        APP_NAME = 'your_app_name'
        DOCKER_IMAGE_NAME = 'your_docker_image_name'
        // Необхідно для роботи в плейграунді
        GOCACHE="/home/jenkins/.cache/go-build/"
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Крок клонування репозиторію
                // TODO: ваш код
            }
        }

        stage('Compile') {
            agent {
                // Використання Docker образу з підтримкою Go версії 1.21.3. Обовʼязково необхідно використати параметр `reuseNode true` для Docker агента для роботи в плейграунді
                // TODO: ваш код
            }
            steps {
                // Компіляція проекту на мові Go. Всі ці флаги необхідні для запуску на пустій файловій системі образу scratch :)
                sh "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-w -s -extldflags \"-static\"' -o ${APP_NAME} ."
            }
        }

        stage('Unit Testing') {
            agent {
                // Використання Docker образу з підтримкою Go версії 1.21.3. Обовʼязково необхідно використати параметр `reuseNode true` для Docker агента для роботи в плейграунді
                // TODO: ваш код
            }
            steps {
                // Виконання юніт-тестів. Команду можна знайти в Google
                // TODO: ваш код
            }
        }

        stage('Archive Artifact and Build Docker Image') {
            parallel {
                stage('Archive Artifact') {
                    steps {
                        // Створення TAR-архіву артефакту з використанням імені додатку APP_NAME та номеру сборки BUILD_NUMBER
                        // TODO: ваш код
                    }
                }

                stage('Build Docker Image') {
                    steps {
                        // Створення Docker образу з імʼям DOCKER_IMAGE_NAME і тегом BUILD_NUMBER та передача аргументу APP_NAME за допомогою флагу `--build-arg`
                        // TODO: ваш код
                    }
                }
            }
        }
    }

    post {
        success {
            // Архівація успішна, артефакт готовий для використання та збереження
            // TODO: ваш код
        }
        always {
            // Завершення пайплайну, можна додати додаткові кроки (наприклад, розгортання) за потребою
            echo 'Pipeline finished'
        }
    }
}
