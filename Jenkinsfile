pipeline
{
  agent any 
    parameters {
        choiceParam('Opeartions', ['Build (default)', 'Deploy'], 'What do you want to do?')
    }
  stages
  {
    stage("Build")
    {
      steps
      {
        sh "mvn clean install"
      }
    }

    stage("Test")
    {
      steps
      {
        sh """
        echo "Testing scripts will be placed here."
        """
      }
    }
    
    stage("Build Docker Image")
    {
      steps
      {
        sh """
        echo "Building Docker Image"
        docker build -t snehanshu11/my-app:1.0-SNAPSHOT .
           """
      }
    }
    stage("Docker Image upload")
    {
      steps
      {
        sh "echo 'Uploading the image to GCR'"
        withDockerRegistry([credentialsId: "docker" , url: ""])
          {
          sh "docker push snehanshu11/my-app:1.0-SNAPSHOT" 
          }
          
      }
    }

    stage("Kubernetes Deployment")
    {
      steps
      {
        sh "echo 'Kubernetes Deployment will happen now.'"
        withDockerRegistry([credentialsId: "docker" , url: ""])
          {
          sh "docker pull snehanshu11/my-app:1.0-SNAPSHOT" 
          }
        sh "gcloud container clusters get-credentials cluster-1 --zone us-central1-c --project my-project-40222"
        sh "kubectl apply -f deployment.yaml"
        sh "kubectl get deployments"
        sh "kubectl get services"
      }
    }    
  }
}
