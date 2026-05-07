FROM quay.io/argoproj/argocd:v3.4.1@sha256:097c922fb910e6bb0278b0e26382f88de4fa5c966564111bddd334051b0e63d7

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
