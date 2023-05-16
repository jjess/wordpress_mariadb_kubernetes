pipeline{

	agent any



	stages {

		stage('Deploy mariadb to kubernetes')
		{
			steps{
				sshagent(['k8s-jenkins'])
				{
					sh 'scp -r -o StrictHostKeyChecking=no mariadb-deployment-pvc.yaml jjess@192.168.56.102:/jenkins_deployments/'
					
					script{
						try{
							sh 'ssh jjess@192.168.56.102 kubectl apply -f ~/jenkins_deployments/mariadb-deployment-pvc.yaml --kubeconfig=~/.kube/config'

							}catch(error)
							{

							}
					}
				}
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}
