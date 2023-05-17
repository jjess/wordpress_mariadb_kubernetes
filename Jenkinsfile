pipeline{

	agent any



	stages {

    stage('Deploy mariadb to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "mariadb-deployment-pvc.yaml")
        }
      }
    }		

}
