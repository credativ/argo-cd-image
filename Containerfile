FROM quay.io/argoproj/argocd:v3.6.0@sha256:a9f9a12f6d26d6514ee3587b5116b86413a1d3fe43d4da00fb418e3abc4eec8c

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
