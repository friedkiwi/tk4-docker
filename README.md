# Docker image for TK4-

This is a dockerized version of Juergen Winkelmann's TK4- MVS 3.8j distribution, designed to be easily deployed on a Kubernetes cluster.

## Using this distribution

Connect using a tn3270e client to the console port (3270) with LU name CONS, and use the web UI (port 8038) to issue `ipl 148`. Then, proceed as normal using the console session to IPL MVS 3.8j. 

## Deploying this image to kubernetes

This image was specifically created so it could be deployed on my aarch64 Kubernetes cluster. If you have an aarch64 cluster, you can deploy it using:

    kubectl create -f  https://raw.githubusercontent.com/friedkiwi/tk4-docker/master/kubernetes/aarch64.yaml

If you have metallb set up, an IP should be allocated for the Hercules web UI (port 8038) and tn3270 connections (port 3270)
