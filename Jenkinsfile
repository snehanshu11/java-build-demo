pipeline
{
  agent any 
  parameters 
  {
    booleanParam(defaultValue: true, name: 'Build', description: 'Build the code')
    booleanParam(defaultValue: false, name: 'Deploy', description: 'Deploy the code')
    string(name: 'DEPLOY_ENV', defaultValue: 'Dev', description: '')
   }
  environment
  {
    DEPLOY_ENV=params.DEPLOY_ENV
  }
  stages
  {
    stage("Build")
    {
      when
      {
        expression 
        {
          params.Build == true
        }
      }
      steps
      {
        sh "mvn clean install"
      }
    }

    stage("Test")
    {
      when
      {
        expression 
        {
          params.Build == true
        }
      }      
      steps
      {
        sh """
        echo "Testing scripts will be placed here."
        """
      }
    }
    
    stage("Build Docker Image")
    {
      when
      {
        expression 
        {
          params.Build == true
        }
      }      
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
      when
      {
        expression 
        {
          params.Build == true
        }
      }      
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
      when
      {
        expression 
        {
          params.Deploy == true
        }
      }
      steps
      {
        sh "echo 'Kubernetes Deployment will happen now in ${env.DEPLOY_ENV}'"
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
