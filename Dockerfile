# gitlab-ci-runner
FROM gitlab/gitlab-runner:alpine

LABEL maintainer="kutzhanov@gmail.com"

COPY register-gitlab-runner.sh /register-gitlab-runner.sh

RUN chmod 755 /register-gitlab-runner.sh

ENTRYPOINT ["/register-gitlab-runner.sh"]
#ENTRYPOINT ["/usr/bin/gitlab-runner"]
