FROM quay.io/argoproj/argocd:v3.2.2@sha256:61a9ed1ee103f681f5a1561683ff4c230343dbc3c56be048d5f3cbd16ee3499e

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
