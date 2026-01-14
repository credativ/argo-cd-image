FROM quay.io/argoproj/argocd:v3.2.4@sha256:612dddd014026592ff7e45dd43fad010f65556254d054444d5371836f778bbeb

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
