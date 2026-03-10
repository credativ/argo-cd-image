FROM quay.io/argoproj/argocd:v3.3.3@sha256:8b9a0993937850c1ee6e2ada47a2be8259d512e959ae58afa39936658f7b52e7

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
