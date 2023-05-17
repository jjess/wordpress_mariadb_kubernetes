pipeline{

	agent any


	stages {
		node {
			stage('Deploy mariadb to Kubernetes') {
				withKubeConfig([credentialsId: 'kubernetes_token',
						serverUrl: 'https://192.168.56.102:6443',
						namespace: 'default'
						]) {
							sh 'kubectl get pods'
							// kubernetesDeploy(configs: "mariadb-deployment-pvc.yaml")
				}
			}
		}
	}

}
