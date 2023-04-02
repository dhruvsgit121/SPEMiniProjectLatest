pipeline {
    // Declare variables that will be used by the later stages
    environment {
        imageName = ""
//          DOCKERHUB_REGISTRY = "dhruvgupta121/calculator-using-devops"
//          DOCKERHUB_CREDENTIALS = credentials('dockerhub-id')
    }

    // The "agent" section configures on which nodes the pipeline can be
    // run. Specifying "agent any" means that Jenkins will run the job on
    // any of the available nodes.
    agent any

    stages {

        stage('Git Pull') {
            steps {
                // credentials are required because its a private repository
                git url: 'https://github.com/dhruvsgit121/SPEMiniProjectLatest.git',
                branch: 'master'
            }
        }

        stage('Maven Build + JUnit Tests') {
            steps {
                sh 'mvn clean install'
            }
        }

        stage('Build Docker Image') {
			steps {
				script{
				    imageName = docker.build "dhruvgupta121/calculator-using-devops:latest"
				}
			}
		}



		stage('Push Docker Image to Docker Hub'){
		    steps{
		        script{
				    docker.withRegistry('' , 'dockerhub-id'){
				    imageName.push()
				    }
		        }
		    }
		}


			  stage('Removing Docker Image from Local') {
                            steps {
                                sh "docker rmi dhruvgupta121/calculator-using-devops:latest"
                            }
                        }



//         // Ansible Deploy to remote server (managed host)
        stage('Ansible Deploy') {
            steps {
                ansiblePlaybook becomeUser: 'null',
                colorized: true,
                installation: 'Ansible',
                inventory: 'inventory',
                playbook: 'deploy-playbook.yml',
                sudoUser: 'null'
            }
        }
    }
}