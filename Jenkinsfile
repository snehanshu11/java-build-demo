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
    
    stage("Build Dcoker-image")
    {
      steps
      {
        sh """
        echo "Building Docker Image"
           """
      }
    }

  }
}
