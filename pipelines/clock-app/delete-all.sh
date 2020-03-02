#!/bin/bash
tkn resources delete clock-app-git clock-app-image --force
tkn task delete build-docker-image-from-git-source --force
tkn task delete deploy-using-kubectl --force
tkn pipeline delete clock-app-pipeline --force
tkn taskrun delete build-docker-image-from-git-source-task-run --force
tkn pipelinerun delete clock-app-pipeline-run-1 --force
kubectl get pods | grep -i pipeline | awk '{print $1}' | xargs kubectl delete pods
kubectl get pods
kubectl get tekton-pipelines
