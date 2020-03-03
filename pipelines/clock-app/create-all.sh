#!/bin/bash
clear
NOW=$(date +"%D %T"); echo $NOW "[INFO] Create resources"
kubectl apply -f clock-app-git.yaml
kubectl apply -f clock-app-image.yaml
kubectl apply -f build-docker-image-from-git-source.yaml
kubectl apply -f deploy-using-kubectl.yaml
kubectl apply -f clock-app-pipeline.yaml
kubectl apply -f clock-app-pipeline-run.yaml
NOW=$(date +"%D %T"); echo $NOW "[INFO] Run pipepline"
sleep 15
NOW=$(date +"%D %T"); echo $NOW "[INFO] Waiting 45 seconds"
sleep 15
NOW=$(date +"%D %T"); echo $NOW "[INFO] Waiting 30 seconds"
sleep 15
NOW=$(date +"%D %T"); echo $NOW "[INFO] Waiting 15 seconds"
sleep 15
clear
kubectl describe pipelinerun.tekton.dev/clock-app-pipeline-run-1
NOW=$(date +"%D %T"); echo $NOW "[INFO] Wait for IP Discovery"
sleep 15
NOW=$(date +"%D %T"); echo $NOW "[INFO] Waiting 45 seconds"
sleep 15
NOW=$(date +"%D %T"); echo $NOW "[INFO] Waiting 30 seconds"
sleep 15
NOW=$(date +"%D %T"); echo $NOW "[INFO] Waiting 15 seconds"
sleep 15
clear
PORTUI=$(kubectl get service svc-clock-app | awk 'NR > 1 {print $4}'); clear; echo "App runnning on http://$PORTUI"
echo "No IP? Run the following command a couple of times" 
echo "kubectl get service svc-clock-app | awk 'NR > 1 {print $4}'"
