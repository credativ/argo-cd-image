FROM quay.io/argoproj/argocd:v3.3.5@sha256:b2ddbd5fa319b6f3f2edba9a04b243a9357b283cf39e1952c9640e156f0995f6

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
