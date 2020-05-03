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
		stage ('deploy')
		{
			steps
			{
				sshagent (credentials: ['DeployTomcat']) 
				{
					sh 'scp -o StrictHostKeyChecking=no -l */target/*.war ec2-user@18.184.192.177:/var/lib/tomcat/webapps'
				}
			}
		}
	}
}
