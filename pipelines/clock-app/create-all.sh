#!/bin/bash
kubectl apply -f clock-app-git.yaml
kubectl apply -f clock-app-image.yaml
kubectl apply -f build-docker-image-from-git-source.yaml
#kubectl apply -f build-docker-image-from-git-source-task-run.yaml
#watch kubectl get taskrun build-docker-image-from-git-source-task-run
kubectl apply -f deploy-using-kubectl.yaml
kubectl apply -f clock-app-pipeline.yaml
kubectl apply -f clock-app-pipeline-run.yaml
kubectl describe pipelinerun.tekton.dev/clock-app-pipeline-run-1
