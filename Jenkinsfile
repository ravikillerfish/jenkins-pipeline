pipeline { 
    agent any
    environment{
        NAME = "RAVI"
    }
    stages {
        stage ('testing env') {
            steps{
                sh echo "${NAME}"
            }
        }
    }
}
