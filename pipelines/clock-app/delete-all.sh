#!/bin/bash
clear
NOW=$(date +"%D %T"); echo $NOW "[INFO] Delete resources"
tkn resources delete clock-app-git clock-app-image --force
tkn task delete build-docker-image-from-git-source --force
tkn task delete deploy-using-kubectl --force
tkn pipeline delete clock-app-pipeline --force
tkn pipelinerun delete clock-app-pipeline-run-1 --force
kubectl get replicaset | grep clock-app | awk '{print $1}' | xargs kubectl delete replicaset
kubectl delete deployment clock-app
kubectl get pods | grep clock-app | awk '{print $1}' | xargs kubectl delete pod
kubectl delete services svc-clock-app
NOW=$(date +"%D %T"); echo $NOW "[INFO] Show pods"
kubectl get pods
kubectl get tekton-pipelines
clear
