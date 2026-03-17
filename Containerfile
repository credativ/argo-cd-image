FROM quay.io/argoproj/argocd:v3.3.4@sha256:9f68a9a360ff65aaca66dfccf675219be73f0ac8c5c96797b6cb7760ee1b9056

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
