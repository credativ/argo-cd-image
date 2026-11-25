FROM quay.io/argoproj/argocd:v3.6.3@sha256:f2e45010dbd6aeff01b845d212b436b2d8e7f44d90d437274906c2ab21e59e0d

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
