docker-centos-chef
==================

Docker image for a Centos 7+ provisionned with Chef to be used in Test
Kitchen (or anywhere you need Chef).

Test it easily with:

    # Get the image
    docker pull sbernard/centos-chef
    # Run it
    docker run -ti --name cc sbernard/centos-chef
    # Kill and remove the container
    docker kill cc; docker rm cc
