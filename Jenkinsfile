pipeline {
    agent any

    environment {
        // Інші змінні середовища...
        APP_NAME = 'my-go-app'
        DOCKER_IMAGE_NAME = 'my-go-app-image'
        // ...
    }

    stages {
        stage('Clone Repository') {
            steps {
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[url: 'your_git_repository_url']]])
            }
        }

        stage('Build and Test') {
            parallel {
                stage('Compile') {
                    steps {
                        script {
                            // Компіляція проекту на мові Go
                            sh "CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -a -ldflags '-w -s -extldflags \"-static\"' -o ${APP_NAME} ."
                        }
                    }
                }

                stage('Unit Testing') {
                    steps {
                        script {
                            // Виконання юніт-тестів
                            sh "go test -v ./..."
                        }
                    }
                }
            }
        }

        stage('Archive Artifact and Build Docker Image') {
            parallel {
                stage('Archive Artifact') {
                    steps {
                        script {
                            // Створення TAR-архіву артефакту
                            sh "tar -czvf ${APP_NAME}.tar.gz ${APP_NAME}"
                        }
                    }
                }

                stage('Build Docker Image') {
                    steps {
                        script {
                            // Створення Docker образу
                            sh "docker build -t ${DOCKER_IMAGE_NAME}:${BUILD_NUMBER} --build-arg APP_NAME=${APP_NAME} ."
                        }
                    }
                }
            }
        }
    }

    post {
        success {
            script {
                // Додаткові дії у разі успішного виконання
                echo 'Pipeline finished successfully'
            }
        }
        always {
            // Завершення пайплайну, можна додати додаткові кроки (наприклад, розгортання) за потребою
            echo 'Pipeline finished'
        }
    }
}
