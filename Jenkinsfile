pipeline{

	agent any


	stages {
		stage('Deploy mariadb to Kubernetes') {
			steps {
				withKubeConfig([credentialsId: 'kubernetes_token',
						serverUrl: 'https://192.168.56.102:6443',
						namespace: 'default'
						]) {
							sh 'kubectl get pods'
							// kubernetesDeploy(configs: "mariadb-deployment-pvc.yaml")
				} // withKubeConfig
			} // steps
		} // stage
	} // stages

} // pipeline
