FROM quay.io/argoproj/argocd:v3.2.3@sha256:9ab6baab65a6b283044a7d7b7dbe50f589564de9c8898d67c77d84b2b5df46bc

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
