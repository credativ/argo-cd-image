FROM quay.io/argoproj/argocd:v3.3.0@sha256:ed0740273790e58154816104c1e1b41fb308a9c516ade3d0f195fa56f1840cca

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
