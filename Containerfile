FROM quay.io/argoproj/argocd:v3.2.1@sha256:a8532a23ed5f6e65afaf2a082b65fc74614549e54774f6b25fe3c993faa7bea3

# Switch to root for the ability to perform install
USER root

COPY --chmod=0755 install.sh /tmp/install.sh
COPY git.sh /tmp/git.sh

RUN /tmp/install.sh

# Switch back to non-root user
USER $ARGOCD_USER_ID
