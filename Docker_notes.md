    # create a persistent volume for your data in /var/lib/grafana (database and plugins)
    docker volume create grafana-storage

    # start grafana
    docker run -ti --user root --volume "<your volume mapping here>" --entrypoint bash grafana/grafana-enterprise:8.2.0
    docker run -d -p 3000:3000 --name=grafana -v grafana-storage:/var/lib/grafana -e "GF_LOG_MODE=console file" grafana/grafana-enterprise
    docker run -p 3000:3000 -e "GF_LOG_MODE=console file" grafana/grafana-enterprise


    docker run —d --restart unless-stopped —-name grafana  \
    -p 3000:3000 \
    -v grafana-storage:/var/lib/grafana \
    -e "GF_LOG_MODE=console file" \
    -ti grafana/grafana-enterprise

    docker run --name jenkins-docker --rm --detach \
      --privileged --network jenkins --network-alias docker \
      --env DOCKER_TLS_CERTDIR=/certs \
      --volume jenkins-docker-certs:/certs/client \
      --volume jenkins-data:/var/jenkins_home \
      --publish 8080:8080 \
      --publish 2376:2376 \
      docker:dind --storage-driver overlay2

    docker run --name jenkins-blueocean --restart=on-failure --detach \
      --network jenkins --env DOCKER_HOST=tcp://docker:2376 \
      --env DOCKER_CERT_PATH=/certs/client --env DOCKER_TLS_VERIFY=1 \
      --publish 8080:8080 --publish 50000:50000 \
      --volume jenkins-data:/var/jenkins_home \
      --volume jenkins-docker-certs:/certs/client:ro \
      myjenkins-blueocean:2.361.2-1



    docker run  -P -it --rm --name $name -h `hostname`.cisco.com -v /home/pyats:/home/okrun/pyats -v /home/pyats/.ssh:/home/okrun/.ssh -v /auto/:/auto/ -v /etc/localtime:/etc/localtime -v /home/pyats/krinata2:/home/pyats/krinata2 32bit/tclpyats:crdc4 



    class c:
         def __init__(self,a,b):
                 self.a = a
                 self.b = b
         def print(self):
                 print(self.a)
                 print(self.b)

