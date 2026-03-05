pipeline {
    agent any

    environment {
        PROJECT_ID = "devops-489105"
    }

    stages {

        stage('Terraform Apply') {
            steps {

                withCredentials([file(credentialsId: 'gcp-sa-json', variable: 'GOOGLE_CREDENTIALS')]) {

                    sh '''
                    export GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_CREDENTIALS
                    terraform init
                    terraform apply -auto-approve -var project_id=${PROJECT_ID}
                    '''

                }
            }
        }
    }
}
