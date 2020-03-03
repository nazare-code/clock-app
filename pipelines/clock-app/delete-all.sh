#!/bin/bash
clear
echo "[TASK 1] Delete resources"
tkn resources delete clock-app-git clock-app-image --force
tkn task delete build-docker-image-from-git-source --force
tkn task delete deploy-using-kubectl --force
tkn pipeline delete clock-app-pipeline --force
tkn taskrun delete build-docker-image-from-git-source-task-run --force
tkn pipelinerun delete clock-app-pipeline-run-1 --force
kubectl get replicaset | grep clock-app | awk '{print $1}' | xargs kubectl delete replicaset
kubectl delete deployment clock-app
kubectl get pods | grep clock-app | awk '{print $1}' | xargs kubectl delete pod
kubectl delete services svc-clockbroker svc-clockui
echo "[TASK 2] Show current resources"
kubectl get pods
kubectl get tekton-pipelines
clear
