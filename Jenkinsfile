pipeline
{
	agent any
	stages
	{
		stage ('scm checkout')
		{
			steps
			{
				git branch: 'master', url: 'https://github.com/jainilaws1/maven-project'
			}
		}
		stage ('compilation')
		{
			steps
			{
				withMaven (jdk: 'AWS JDK' , maven: 'AWS Maven')
				{
					sh 'mvn compile'
				}
			}
		}
		stage ('test')
		{
			steps
			{
				withMaven (jdk: 'AWS JDK' , maven: 'AWS Maven')
				{
					sh 'mvn test'
				}
			}
		}
		stage ('package')
		{
			steps
			{
				withMaven (jdk: 'AWS JDK' , maven: 'AWS Maven')
				{
					sh 'mvn package'
				}
			}
		}
		stage ('Docker Build')
		{
			steps
			{
				sh 'docker build . -t tomcatWebapp:${BUILD_ID}'
			}
			
		}
		
	}
}
