FROM quay.io/argoproj/argocd:v3.5.5@sha256:13db7b10db23283b1b36f855046602e18539a8a8204c9f6f039e8896c8897518

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
