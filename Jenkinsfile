pipeline
{
  agent any 

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
        withDockerRegistry([credentialsId: "docker-access" , url: ""])
          {
          sh "docker push snehanshu11/my-app:1.0-SNAPSHOT" 
          }
          
      }
    }

  }
}
