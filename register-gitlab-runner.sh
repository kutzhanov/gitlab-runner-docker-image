#!/usr/bin/env bash

gitlab-runner register \
      --url $GITLAB_URL --registration-token $REGISTRATION_TOKEN \
      --executor docker --description "My Runner" \
      --docker-image "docker:latest" \
      --docker-volumes /var/run/docker.sock:/var/run/docker.sock
