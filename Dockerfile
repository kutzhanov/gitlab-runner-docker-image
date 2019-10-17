FROM gitlab/gitlab-runner:alpine

LABEL maintainer="kutzhanov@gmail.com"

#gitlab-runner --restart always \
#  -v /var/run/docker.sock:/var/run/docker.sock \
#  -v /srv/gitlab-runner/config:/etc/gitlab-runner:Z \
#  gitlab/gitlab-runner:latest

WORKDIR /srv/gitlab-runner/config/

RUN gitlab-runner register \
      --url $GITLAB_URL --registration-token $REGISTRATION_TOKEN \
      --executor docker --description "My Runner" \
      --docker-image "docker:latest" \
      --docker-volumes /var/run/docker.sock:/var/run/docker.sock

#VOLUME [ "/var/run/docker.sock" ]

VOLUME [/etc/gitlab-runner /home/gitlab-runner]
ENTRYPOINT ["/usr/bin/dumb-init" "/entrypoint"]
CMD ["run" "--user=gitlab-runner" "--working-directory=/home/gitlab-runner"]
