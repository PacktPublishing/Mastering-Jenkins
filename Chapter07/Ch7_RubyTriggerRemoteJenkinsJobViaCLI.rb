# ---------------------------------------------------------
# FUNC: jenkins_triggerRemoteJenkinsJob(sJenkinsURL, sJobName, sParameters)
# DESC: This Function will trigger a remote Jenkins Job
# ------------------------------------------------
def jenkins_triggerRemoteJob(sURL, sJobName, sParameters)
	
	# -- sURL = URL for jenkins server (including port)
	# -- sJobName = Job Name to trigger
	# -- sParameters = Build parameters to specify X=Y format

	puts "Downloading jenkins cli"
		`cd #{ENV['WORKSPACE']} && rm jenkins-cli* && wget http://build.lifesize.com/jnlpJars/jenkins-cli.jar`
		
		puts "Executing remote Jenkins Job: #{sJobName}"
		`cd #{ENV['WORKSPACE']} && java -jar 'jenkins-cli.jar' -s #{sURL} build \"#{sJobName}\" -s --username foouser --password foouser123 -p #{sParameters} -s echo The exit code is %errorlevel%`
end
