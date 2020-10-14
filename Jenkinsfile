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
        cp /root/.m2/repository/com/mycompany/app/my-app/1.0-SNAPSHOT/my-app-1.0-SNAPSHOT.jar .
        docker build --build-arg JAR_FILE=my-app-1.0-SNAPSHOT.jar
           """
      }
    }

  }
}
