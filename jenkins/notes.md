
#### bash scripts from jenkins

    https://stackoverflow.com/questions/21103727/how-to-tell-jenkins-to-use-a-particular-virtualenv-python

#### Recovering password from jenkins

    https://www.codurance.com/publications/2019/05/30/accessing-and-dumping-jenkins-credentials
    
      #/bin/bash
      set -euox pipefail

      # Get an unique venv folder to using *inside* workspace
      VENV=".venv-$BUILD_NUMBER"

      # Initialize new venv
      virtualenv "$VENV"

      # Update pip
      PS1="${PS1:-}" source "$VENV/bin/activate"

      # <YOUR CODE HERE>
    
steps:

    1. find jenkisn home directory ( /var/lib/jenkins/  for ubuntu 16.4 )
      check if env variable $JENKINS_HOME present
    
    2. [ cat credentials.xml ] inside jenkisn home folder
  
    3. notedown phasephrase you want to decrypt

    4. login to http://<10.78.210.152:8080>/script
  
    5. println( hudson.util.Secret.decrypt("{<phasephrase>}") )
