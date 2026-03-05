pipeline {
    agent any

    environment {
        CREDENTIALS = credentials('hello-480')
        PROJECT_ID = "devops-489105"
    }
    stages {

        stage('Terraform init & Apply') {
            steps {
                sh ''' 
                teraform init
                teraform apply -auto-approve -var project_id=${PROJECT_ID}
                '''
            }
        }
    }
} 
