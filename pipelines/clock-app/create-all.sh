#!/bin/bash
kubectl apply -f clock-app-git.yaml
sleep 1
kubectl apply -f clock-app-image.yaml
sleep 1
kubectl apply -f build-docker-image-from-git-source.yaml
sleep 1
kubectl apply -f build-docker-image-from-git-source-task-run.yaml
#watch kubectl get taskrun build-docker-image-from-git-source-task-run
