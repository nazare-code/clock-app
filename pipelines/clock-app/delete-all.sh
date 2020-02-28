#!/bin/bash
tkn resources delete clock-app-git clock-app-image --force
tkn task delete build-docker-image-from-git-source --force
tkn taskrun delete build-docker-image-from-git-source-task-run --force
