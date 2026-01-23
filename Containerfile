FROM quay.io/argoproj/argocd:v3.2.6@sha256:64e4239359438fb0ad42d46ae2061daa841ae52d4e63f94017929f7e26dd51b2

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
