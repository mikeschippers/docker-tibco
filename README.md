Build, ship and run TIBCO Software using Docker 
=================== 
[TOC] 
Introduction 
-------------- 

Docker is a platform to develop, ship, and run applications by using standardized containers. Docker containers offer various advantages:

 - Faster delivery of your applications 
 - Deploy and scale more easily 
 - Get higher density and run more workloads
 - Faster deployment makes for easier managementFrom 

From [Wikipedia](https://en.wikipedia.org/wiki/Docker_%28software%29):

> “Docker is an open-source project under Apache 2.0 license that automates the deployment of applications inside software containers,  by providing an additional layer of abstraction and automation of  operating-system-level virtualization on Linux. Docker uses resource isolation features of the Linux kernel […] to allow independent  “containers” to run within a single Linux instance, avoiding the  overhead of starting and maintaining virtual machines.”


In this repository you will find everything you need to run several TIBCO products inside a Docker container.


####Image Hierarchy 
The diagram below provides an overview of the hierarchy of the Docker images / containers

![Docker TIBCO Image Hierarchy ](http://i.imgur.com/5L4XqvV.png) 

| Image	 | Description | 
| --- | --- |
| tibbase:1.0.0 | The `"tibbase"` image is the starting point for all the underlying TIBCO images. It contains all the dependencies / packages (such as open-jdk, wget, unzip etc) in order to build and run TIBCO Software. The image is bases on [Debian 8 (jessie)](https://hub.docker.com/_/debian/) since it’s very tightly controlled and kept extremely minimal (currently around 125 MB), while still being a full distribution. | 
| tibrv:8.4.4 | The `"tibrv"` image enables you to install and run TIBCO Rendezvous® software. TIBCO Rendezvous® is a publish/subscribe messaging technology which is used for high-speed throughput |
| tibtra:5.10.0 | The `"tibtra"` image contains the TIBCO Runtime Agent software and comes with all the third-party software that is needed to run TIBCO ActiveMatrix BusinessWorks 5. TIBCO Runtime Agent requires TIBCO Rendezvous® to be installed for Rendezvous palette activities and / or TIBCO Hawk® micro agents features. Hence this images is derivatived from the `"tibrv"` image | 
| tibbw:5.13.0 | The `"tibbw"` image contains the runtime capabilaties for TIBCO ActiveMatix BusinessWorks 5 | 
| tibbw:6.3.1 | The `"tibbw"` image contains the runtime capabilaties for TIBCO ActiveMatix BusinessWorks 6 |
| tibtea:2.2.0 | The `"tibtea"` image enables you to build and run the TIBCO Enterprise Administrator |


Building the TIBCO Software Docker images
------
First of all you need to install  the Docker Engine. If you haven't done so already there are plenty of guides available on [how to install the Docker Engine](https://docs.docker.com/engine/installation/). We also need the TIBCO software installation, which can be obtained from [TIBCO's edelivery website](http://edelivery.tibco.com). Note you have to be a licensed TIBCO customer or partner in order to download the software. Next clone this repository and store the installation archives in the correct folder. 

Now we are able to build the Docker images using the following command's:

    docker build -t="tibbase:1.0.0" .\tibbase\
    docker build -t="tibrv:8.4.4" .\tibrv\
    docker build -t="tibtra:5.10.0" .\tibtra\
    docker build -t="tibbw:5.13.0" .\tibbw\5.x\
    docker build -t="tibadmin:5.10.0" .\tibadmin\
    docker build -t="tibbw:6.3.1" .\tibbw\6.x\
    docker build -t="tibems:8.2.2" .\tibems\
    docker build -t="tibtea:2.2.0" .\tibtea\

Running TIBCO Software inside a Docker container
---------------------------------
#### TIBCO BusinessWorks 5

In order to run a TIBCO BusinessWorks 5 service in a docker container we need to create a new Dockerfile specifically for the service we want to run. This Dockerfile will be derivatived  from the Docker image `"tibbw:5.13.0"` we have built earlier. A Dockerfile / image example looks like this:

    FROM tibbw:5.13.0
    
    ADD sampleproject /sampleproject
    
    EXPOSE 8080
    
    ENTRYPOINT ["/opt/tibco/bw/5.13/bin/bwengine", "/sampleproject/"

The Dockerfile should be saved in the same directory as your TIBCO BusinessWorks 5 project. Next, we have to build the Docker image:

    docker build -t="sampleproject:1.0.0" .

After we have built the Docker image we are able to start the Docker container. All we have to do is to create a new container with `"docker run"`. For example:

    docker run -p 8080:8080 sampleproject:1.0.0

Now we can create any number of perfectly isolated and self-contained instances of our TIBCO service. 


#### TIBCO BusinessWorks 6

Work in progress..



#### TIBCO Enterprise Message Service (EMS) 

After you have built the tibems Docker Image you can create a container by running the following command:


    docker run -p 7222:7222 tibems:8.2.2

This container will start the TIBCO Enterprise Message daemon (tibemsd) with default settings. The logs are redirected to the sdtOut and can be viewed by running `"docker logs <containerid>"`.

Optionally, the Docker Engine offers the possibility to use [data volumes](https://docs.docker.com/engine/userguide/containers/dockervolumes/) to persist your datastore and/or configuration files (tibemsd.conf, queues.conf etc) on your local file system.

Contributing 
-------------- 
Want to help improving the Dockerfiles? Feel free to create a pull request or to fork this repository. If you find any problems please fill out an [issue](https://github.com/mikeschippers/docker-tibco/issues/new) 
