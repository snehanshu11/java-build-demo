pipeline
{
  agent any 

  stages
  {
    stage("Build")
    {
      steps
      {
        sh "maven clean install"
      }
    }

    stage("Test")
    {
      steps
      {
        sh "hostname "
      }
    }

  }
}
