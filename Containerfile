FROM quay.io/argoproj/argocd:v3.2.5@sha256:090c287bdc16b4649d3fe30e2fa73633debe115cf40d182d4a0a9f125695b64a

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
