FROM quay.io/argoproj/argocd:v3.2.0@sha256:3c9b3b33a7e6c9c56a9d8417af1845afc516f714941962208b125017bbc1e4b1

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
