#!/bin/bash
clear
echo "[TASK 1] Create resources"
kubectl apply -f clock-app-git.yaml
kubectl apply -f clock-app-image.yaml
kubectl apply -f build-docker-image-from-git-source.yaml
#kubectl apply -f build-docker-image-from-git-source-task-run.yaml
#watch kubectl get taskrun build-docker-image-from-git-source-task-run
kubectl apply -f deploy-using-kubectl.yaml
kubectl apply -f clock-app-pipeline.yaml
kubectl apply -f clock-app-pipeline-run.yaml
echo "[TASK 2] Waiting deployment"
sleep 30
echo "[TASK 3] Just 30 seconds more"
sleep 30
clear
kubectl describe pipelinerun.tekton.dev/clock-app-pipeline-run-1
echo "[TASK 4] Waiting services"
sleep 30
echo "[TASK 5] Just 30 seconds more"
sleep 30
clear
PORTUI=$(kubectl get service svc-clock-app | awk 'NR > 1 {print $4}'); clear; echo "App runnning on http://$PORTUI"
echo "If no IP appears, run the following command a couple of times" 
echo "kubectl get service svc-clock-app | awk 'NR > 1 {print $4}'"
