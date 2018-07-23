FROM jenkins
LABEL description="Container build with Jenkins + Git + Maven + Docker"
MAINTAINER Carlos Roberto Claramount (crclaramount@gmail.com)
USER root
RUN apt-get update && \
	apt-get -y install apt-transport-https \
		ca-certificates \
		curl \
		gnupg2 \
		software-properties-common \ 
		openjdk-8-jdk \
		maven \
		git && \
	curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add - && \
	add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
		$(lsb_release -cs) \
		stable" && \
	apt-get update && \
	apt-get -y install docker-ce && \
	groupadd -g 1001 jenkins || true && \
	useradd -m -d /home/jenkins -s /bin/bash -g jenkins -u 1001 jenkins || true && \
	gpasswd -a jenkins wheel && \
	chown -R 1001:1001 /tmp &&\
	groupadd docker || true && \
	usermod -aG docker jenkins
